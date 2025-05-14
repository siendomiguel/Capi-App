const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

const stripe = require("stripe")(
  "sk_test_51P5xUwDqyTvyz5vL5phy3XuCNLktgTDKAeZovZHH0dxv4M20VHSZJ9hodi6sOd6wnmIGx8eAQGYQqFCk9jwJ2tEF00ewIYvMxf",
); // TU CLAVE STRIPE AQUÍ

exports.stripeCustomerSubscription = functions.https.onRequest(
  async (req, res) => {
    try {
      // Verifica la firma del webhook
      const sig = req.headers["stripe-signature"];
      const endpointSecret = "whsec_DfzIfRg6WMucCjbsXh7g76axapwkmyWR"; // SECRETO DE TU ENDPOINT AQUÍ
      const event = stripe.webhooks.constructEvent(
        req.rawBody,
        sig,
        endpointSecret,
      );

      // Manejo del evento 'customer.subscription.created'
      if (event.type === "customer.subscription.created") {
        const dataObject = event.data.object;
        console.log("Evento de suscripción creada recibido");
        console.log("ID de cliente en Stripe:", dataObject.customer);

        // Consulta en Firestore para encontrar la clínica que coincide con el cliente de Stripe
        const clinicaSnapshot = await admin
          .firestore()
          .collection("clinica")
          .where("stripe_cust_id", "==", dataObject.customer)
          .get();

        // Actualiza la suscripción en el documento de la clínica
        clinicaSnapshot.forEach(async (clinicaDoc) => {
          const clinicaRef = clinicaDoc.ref;
          await clinicaRef.update({
            stripe_subscription_id: dataObject.id,
            stripe_plan_end_date: admin.firestore.Timestamp.fromMillis(
              dataObject.current_period_end * 1000,
            ),
            stripe_subscription_status: dataObject.status,
            stripe_subscription_product_id: dataObject.plan.product,
            stripe_subscription_price_id: dataObject.plan.id,
          });
          console.log(
            "Suscripción creada y procesada para el cliente:",
            dataObject.customer,
          );
        });
      }

      // Manejo del evento 'customer.subscription.deleted'
      if (event.type === "customer.subscription.deleted") {
        const dataObject = event.data.object;
        console.log("Evento de suscripción eliminada recibido");
        console.log("ID de cliente en Stripe:", dataObject.customer);

        // Consulta y actualiza la clínica relacionada
        const clinicaSnapshot = await admin
          .firestore()
          .collection("clinica")
          .where("stripe_cust_id", "==", dataObject.customer)
          .get();

        clinicaSnapshot.forEach(async (clinicaDoc) => {
          const clinicaRef = clinicaDoc.ref;
          await clinicaRef.update({
            stripe_subscription_id: dataObject.id,
            stripe_plan_end_date: admin.firestore.Timestamp.fromMillis(
              dataObject.current_period_end * 1000,
            ),
            stripe_subscription_status: dataObject.status,
            stripe_subscription_product_id: dataObject.plan.product,
            stripe_subscription_price_id: dataObject.plan.id,
            limitePersonal: 0,
            limitePacientes: 0,
            nombrePlan: "Sin Plan Activo",
          });
          console.log(
            "Suscripción eliminada y actualizada para el cliente:",
            dataObject.customer,
          );
        });
      }

      // Manejo del evento 'customer.subscription.updated'
      if (event.type === "customer.subscription.updated") {
        const dataObject = event.data.object;
        console.log("Evento de suscripción actualizada recibido");
        console.log("ID de cliente en Stripe:", dataObject.customer);

        const clinicaSnapshot = await admin
          .firestore()
          .collection("clinica")
          .where("stripe_cust_id", "==", dataObject.customer)
          .get();

        clinicaSnapshot.forEach(async (clinicaDoc) => {
          const clinicaRef = clinicaDoc.ref;

          // Verifica el producto del plan y actualiza los valores según el plan específico
          if (dataObject.plan.product === "prod_PuoSl2WutfXHyI") {
            // Producto Starter
            await clinicaRef.update({
              nombrePlan: "Starter",
              limitePacientes: 50,
              limitePersonal: 2,
              stripe_subscription_id: dataObject.id,
              stripe_plan_end_date: admin.firestore.Timestamp.fromMillis(
                dataObject.current_period_end * 1000,
              ),
              stripe_subscription_status: dataObject.status,
              stripe_subscription_product_id: dataObject.plan.product,
              stripe_subscription_price_id: dataObject.plan.id,
            });
          } else if (dataObject.plan.product === "prod_PuoUS5eS03l2j9") {
            // Producto Premium
            await clinicaRef.update({
              nombrePlan: "Premium",
              limitePacientes: 200,
              limitePersonal: 3,
              stripe_subscription_id: dataObject.id,
              stripe_plan_end_date: admin.firestore.Timestamp.fromMillis(
                dataObject.current_period_end * 1000,
              ),
              stripe_subscription_status: dataObject.status,
              stripe_subscription_product_id: dataObject.plan.product,
              stripe_subscription_price_id: dataObject.plan.id,
            });
          } else {
            // Producto Elite o genérico
            await clinicaRef.update({
              nombrePlan: "Elite",
              limitePacientes: 500,
              limitePersonal: 6,
              stripe_subscription_id: dataObject.id,
              stripe_plan_end_date: admin.firestore.Timestamp.fromMillis(
                dataObject.current_period_end * 1000,
              ),
              stripe_subscription_status: dataObject.status,
              stripe_subscription_product_id: dataObject.plan.product,
              stripe_subscription_price_id: dataObject.plan.id,
            });
          }
          console.log(
            "Suscripción actualizada y procesada para el cliente:",
            dataObject.customer,
          );
        });
      }

      // Manejo del evento 'checkout.session.completed'
      if (event.type === "checkout.session.completed") {
        const dataObject = event.data.object;
        console.log("Evento de sesión de pago completada recibido");
        console.log("ID de sesión de pago:", dataObject.id);

        const citaSnapshot = await admin
          .firestore()
          .collection("citas")
          .where("checkoutSessionId", "==", dataObject.id)
          .get();
        const clinicaSnapshot = await admin
          .firestore()
          .collection("clinica")
          .where("stripe_cust_id", "==", dataObject.customer)
          .get();

        // Actualiza el estado del pago en la cita
        citaSnapshot.forEach(async (citaDoc) => {
          const citaRef = citaDoc.ref;
          await citaRef.update({ paymentStatus: dataObject.payment_status });
          console.log("Sesión de pago procesada para la cita:", dataObject.id);
        });

        // Actualiza el estado de la suscripción en la clínica
        clinicaSnapshot.forEach(async (clinicaDoc) => {
          const clinicaRef = clinicaDoc.ref;
          await clinicaRef.update({
            stripe_subscription_status: dataObject.status,
          });
          console.log(
            "Suscripción actualizada para el cliente:",
            dataObject.customer,
          );
        });
      }

      return res.sendStatus(200); // Respuesta exitosa
    } catch (err) {
      return res.sendStatus(400); // Respuesta en caso de un error
    }
  },
);

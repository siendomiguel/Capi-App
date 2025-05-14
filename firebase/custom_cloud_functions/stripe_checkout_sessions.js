const functions = require("firebase-functions");
const admin = require("firebase-admin");

const stripe = require("stripe")(
  "sk_test_51P5xUwDqyTvyz5vL5phy3XuCNLktgTDKAeZovZHH0dxv4M20VHSZJ9hodi6sOd6wnmIGx8eAQGYQqFCk9jwJ2tEF00ewIYvMxf",
); //replace with actual key

exports.stripeCheckoutSessions = functions.https.onRequest(async (req, res) => {
  try {
    const sig = req.headers["stripe-signature"];
    const endpointSecret = "whsec_cuixJDsHjvmcb8PMHm5LmhfTQgp8GlQv"; // Replace with your actual endpoint secret

    const event = stripe.webhooks.constructEvent(
      req.rawBody,
      sig,
      endpointSecret,
    );

    if (event.type === "checkout.session.completed") {
      const dataObject = event.data.object;
      console.log("Evento de sesión de pago completada recibido");
      console.log("ID de sesión de pago:", dataObject.id);

      const citaSnapshot = await admin
        .firestore()
        .collection("citas")
        .where("checkoutSessionId", "==", dataObject.id)
        .get();

      // Actualiza el estado del pago en la cita
      citaSnapshot.forEach(async (citaDoc) => {
        const citaRef = citaDoc.ref;
        await citaRef.update({ paymentStatus: dataObject.payment_status });
        console.log("Sesión de pago procesada para la cita:", dataObject.id);
      });
    }

    return res.sendStatus(200);
  } catch (err) {
    console.error("Error processing webhook:", err);
    return res.sendStatus(400);
  }
});

const functions = require("firebase-functions");
const admin = require("firebase-admin");

// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.stripeOAuth = functions.https.onRequest(async (req, res) => {
  const code = req.query.code;
  const state = req.query.state;

  if (!code) {
    // res.status(400).send('Error: No code provided');
    res.redirect("https://app.doctorcapi.com/failedStripeConnect"); // redirect url
    return;
  }

  // console.log('Received code:', code); // Log the code
  // console.log('Received state:', state); // Log the state

  const client_secret =
    "sk_test_51P5xUwDqyTvyz5vL5phy3XuCNLktgTDKAeZovZHH0dxv4M20VHSZJ9hodi6sOd6wnmIGx8eAQGYQqFCk9jwJ2tEF00ewIYvMxf"; //your stripe secret
  const url = "https://connect.stripe.com/oauth/token";

  try {
    const response = await fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: new URLSearchParams({
        client_secret: client_secret,
        code: code,
        grant_type: "authorization_code",
      }),
    });

    const responseText = await response.text(); // Get the response as text first
    console.log("Raw Stripe Response:", responseText); // Log the raw response

    try {
      const data = JSON.parse(responseText); // Parse the text as JSON

      // Check for a successful Stripe response before proceeding
      if (data.error) {
        res.status(500).send(`Stripe Error: ${data.error_description}`);
        return;
      }

      // Proceed if state is provided
      if (state) {
        const userDocRef = admin.firestore().collection("users").doc(state);
        const userDoc = await userDocRef.get();

        if (!userDoc.exists) {
          console.log("No matching document.");
          res.status(404).send("No user found with the given ID");
          return;
        }

        // Update the user document with the Stripe OAuth ID
        await userDocRef.update({
          StripeOAuthID: data.stripe_user_id, // From Stripe's response
        });
        console.log("Stripe OAuth ID updated in the user document");
      }

      res.redirect("https://app.doctorcapi.com/successStripeConnect"); // redirect url
    } catch (error) {
      console.error("Error parsing JSON:", error);
      res.status(500).send(`Error parsing JSON: ${error}`);
      return;
    }
  } catch (error) {
    console.error("Server Error:", error);
    res.status(500).send(`Server Error: ${error}`);
  }
});

const functions = require("firebase-functions");
const fetch = require("node-fetch");
const cors = require("cors")({ origin: true });

exports.revokeStripeAccount = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    const { accountId } = req.body;

    const client_id = "...";
    const secret_key = "...";

    try {
      const response = await fetch(
        "https://connect.stripe.com/oauth/deauthorize",
        {
          method: "POST",
          headers: {
            Authorization: `Bearer ${secret_key}`,
            "Content-Type": "application/x-www-form-urlencoded",
          },
          body: new URLSearchParams({
            client_id: client_id,
            stripe_user_id: accountId,
          }),
        },
      );

      const data = await response.json();
      res.status(200).json(data);
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  });
});

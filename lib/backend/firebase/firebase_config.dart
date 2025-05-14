import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBl6vU0HeF4GTVhDgPk9YkvO1eXP2mBb3U",
            authDomain: "capideveloper-6078c.firebaseapp.com",
            projectId: "capideveloper-6078c",
            storageBucket: "capideveloper-6078c.firebasestorage.app",
            messagingSenderId: "980437655977",
            appId: "1:980437655977:web:a9cf5028d2c1d8d4cfe4b8",
            measurementId: "G-HDK7WNKXPT"));
  } else {
    await Firebase.initializeApp();
  }
}

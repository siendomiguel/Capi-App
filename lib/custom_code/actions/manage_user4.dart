// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

Future<String?> manageUser4(
  String? emailAddress,
  String? password,
) async {
  // Add your function code here!
  // Add your function code here!

  var uuid = Uuid();
  String randomDoc = uuid.v4();
  DateTime createdTime = DateTime.now();
  FirebaseApp app = await Firebase.initializeApp(
      name: randomDoc, options: Firebase.app().options);

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: emailAddress!,
      password: password!,
    );

    DocumentReference userDocRef = firestore.collection('users').doc(randomDoc);

    await userDocRef.set({
      'email': emailAddress,
      'uid': randomDoc,
      'created_time': createdTime,
    });

    return randomDoc;
  } catch (e) {
    print(e);
    return null;
  }
}

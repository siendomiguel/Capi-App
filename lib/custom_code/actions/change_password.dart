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

Future<bool> changePassword(
  BuildContext context,
  String currentPassword,
  String newPassword,
) async {
  // Add your function code here!
  bool success = false;

  //Create an instance of the current user.
  var user = await FirebaseAuth.instance.currentUser!;
  //Must re-authenticate user before updating the password. Otherwise it may fail or user get signed out.

  final cred = await EmailAuthProvider.credential(
      email: user.email!, password: currentPassword);
  await user.reauthenticateWithCredential(cred).then((value) async {
    await user.updatePassword(newPassword).then((_) {
      success = true;
      var uid;
      var usersRef;
      usersRef.doc(uid).update({"password": newPassword});
    }).catchError((error) {
      print(error);
    });
  }).catchError((err) {
    print(err);
  });

  return success;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

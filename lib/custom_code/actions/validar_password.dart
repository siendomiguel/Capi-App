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

Future<bool> validarPassword(String pass) async {
  try {
    // Obtener el usuario actual
    User? user = FirebaseAuth.instance.currentUser;

    // Crear credencial de email y contraseña
    AuthCredential credential = EmailAuthProvider.credential(
      email: user!.email!,
      password: pass,
    );

    // Reautenticar al usuario con la credencial
    await user.reauthenticateWithCredential(credential);

    // La reautenticación fue exitosa
    return true;
  } catch (e) {
    // La reautenticación falló
    return false;
  }
}

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

Future<ClinicaRecord?> validarInvitacionClinica(String clinicaID) async {
  try {
    final clinicaRef = ClinicaRecord.collection.doc(clinicaID);
    final snapshot = await clinicaRef.get();

    if (snapshot.exists) {
      return ClinicaRecord.fromSnapshot(snapshot);
    } else {
      return null;
    }
  } catch (e, stacktrace) {
    print('Error validando clínica: $e');
    print(stacktrace);
    return null;
  }
}

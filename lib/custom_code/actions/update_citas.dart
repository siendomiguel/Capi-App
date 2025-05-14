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

Future updateCitas(
  DocumentReference userDoctor,
  DocumentReference userPaciente,
  String estado,
) async {
  try {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('citas')
        .where('doctor', isEqualTo: userDoctor)
        .where('paciente', isEqualTo: userPaciente)
        .where('estado', isEqualTo: estado)
        .get();

    final batch = FirebaseFirestore.instance.batch();

    for (var doc in querySnapshot.docs) {
      batch.update(doc.reference, {'estado': 'Cancelada'});
    }

    await batch.commit();
    print('Todos los documentos han sido actualizados a Cancelada.');
  } catch (e, stacktrace) {
    print('Error actualizando documentos: $e');
    print(stacktrace);
  }
}

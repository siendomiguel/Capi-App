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

Future<List<DocumentReference>> eliminarUsersDuplicados(
    List<DocumentReference>? miembros) async {
  // eliminar miembros duplicados
  if (miembros == null || miembros.isEmpty) {
    return [];
  }

  final Set<DocumentReference> uniqueMiembros = {};
  final List<DocumentReference> duplicatedMiembros = [];

  for (final miembro in miembros) {
    if (!uniqueMiembros.add(miembro)) {
      duplicatedMiembros.add(miembro);
    }
  }

  if (duplicatedMiembros.isNotEmpty) {
    final batch = FirebaseFirestore.instance.batch();

    for (final miembro in duplicatedMiembros) {
      batch.delete(miembro);
    }

    await batch.commit();
  }

  return uniqueMiembros.toList();
}

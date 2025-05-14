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

Future<DocumentReference?> verificarDuplicados(String? nombre) async {
  // Add your function code here!
  if (nombre == null || nombre.isEmpty) {
    print("Nombre no válido.");
    return null; // Devuelve null si el nombre no es válido
  }

  // Referencia a la colección 'especialidad'
  CollectionReference especialidadCollection =
      FirebaseFirestore.instance.collection('especialidad');

  // Verificar si el documento ya existe en la colección
  QuerySnapshot query =
      await especialidadCollection.where('nombre', isEqualTo: nombre).get();

  if (query.docs.isEmpty) {
    // Si no existe, agregar el nuevo documento
    DocumentReference newDocRef =
        await especialidadCollection.add({'nombre': nombre});
    print("Nombre agregado correctamente.");
    return newDocRef; // Devuelve la referencia del documento recién agregado
  } else {
    // Si existe, no hacer nada
    print("El nombre ya existe en la colección.");
    return null; // Devuelve null si el nombre ya está en la colección
  }
}

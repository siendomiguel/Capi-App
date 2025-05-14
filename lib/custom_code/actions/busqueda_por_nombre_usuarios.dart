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

Future<List<UsersRecord>> busquedaPorNombreUsuarios(
    String? nombreBuscado) async {
  List<UsersRecord> usuariosList = [];

  if (nombreBuscado == null || nombreBuscado.trim().isEmpty) {
    print("[Error] No se proporcionó un nombre válido.");
    return usuariosList;
  }

  String nombreNormalizado = nombreBuscado.toLowerCase().trim();
  print("[INFO] Buscando usuarios con: $nombreNormalizado");

  try {
    // 🔹 Lista de campos en los que se va a buscar
    List<String> campos = ['nombre', 'apellidoPaterno', 'apellidoMaterno'];
    Set<String> idsUnicos = {}; // 🔹 Para evitar duplicados
    List<UsersRecord> resultadosTemporales = [];

    for (String campo in campos) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where(campo, isGreaterThanOrEqualTo: nombreNormalizado)
          .where(campo,
              isLessThanOrEqualTo: nombreNormalizado +
                  '\uf8ff') // 🔥 Permite coincidencias parciales
          .get();

      for (var doc in querySnapshot.docs) {
        if (!idsUnicos.contains(doc.id)) {
          // Evitar duplicados
          UsersRecord usuario = UsersRecord.fromSnapshot(doc);
          resultadosTemporales.add(usuario);
          idsUnicos.add(doc.id);
        }
      }
    }

    print("[INFO] Usuarios encontrados: ${resultadosTemporales.length}");
    return resultadosTemporales;
  } catch (e) {
    print("[Error] Falló la consulta a Firestore: $e");
    return [];
  }
}

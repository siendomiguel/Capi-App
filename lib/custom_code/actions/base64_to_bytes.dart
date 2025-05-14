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

import 'dart:convert';
import 'dart:typed_data';

Future<FFUploadedFile> base64ToBytes(String? base64) async {
  if (base64 == null || base64.isEmpty) {
    throw Exception('El string base64 es nulo o vacío');
  }

  try {
    // Decodificar el string Base64 a bytes (Uint8List)
    final Uint8List bytes = base64Decode(base64);

    // Crear un nombre de archivo para el FFUploadedFile (puedes personalizarlo)
    final String fileName =
        'documento_${DateTime.now().millisecondsSinceEpoch}.pdf';

    // Crear y retornar un objeto FFUploadedFile con los bytes
    return FFUploadedFile(
      name: fileName,
      bytes: bytes,
      height: null, // No aplicable para PDF
      width: null, // No aplicable para PDF
      blurHash: null, // Opcional, generalmente usado para imágenes
    );
  } catch (e) {
    print('Error al convertir base64 a bytes: $e');
    throw Exception('No se pudo convertir el string base64 a bytes: $e');
  }
}

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

import 'dart:typed_data';
import 'dart:html' as html; // Solo para Flutter Web
import 'dart:convert';

Future downloadPdf(FFUploadedFile pdfBytes) async {
  if (pdfBytes.bytes == null || pdfBytes.bytes!.isEmpty) {
    throw Exception('El archivo PDF no contiene datos.');
  }

  try {
    final blob = html.Blob([pdfBytes.bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);

    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', pdfBytes.name ?? 'documento.pdf')
      ..click();

    html.Url.revokeObjectUrl(url);
  } catch (e) {
    print('Error al intentar descargar el PDF: $e');
    throw Exception('No se pudo descargar el archivo PDF');
  }
}

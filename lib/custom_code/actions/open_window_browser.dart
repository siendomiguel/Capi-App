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

import 'dart:html' as html;
import 'dart:async';

Future openWindowBrowser() async {
  // Abrir la pestaña en respuesta a una interacción del usuario
  final nuevaVentana = html.window.open(
    'http://localhost:51762/pdftest', // URL local o de producción
    '_blank',
  );

  // Esperar 5 segundos y luego cerrarla
  await Future.delayed(Duration(seconds: 5));

  nuevaVentana?.close();
}

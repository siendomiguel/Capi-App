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

Future<dynamic> detectarNavegador() async {
  final String userAgent = html.window.navigator.userAgent.toLowerCase();

  // Inicializar variable para guardar el nombre del navegador
  String navegador = "Navegador desconocido";

  // Detectar navegador basado en el user agent
  if (userAgent.contains("edge") || userAgent.contains("edg")) {
    navegador = "Microsoft Edge";
  } else if (userAgent.contains("opr") || userAgent.contains("opera")) {
    navegador = "Opera";
  } else if (userAgent.contains("chrome") && !userAgent.contains("chromium")) {
    navegador = "Google Chrome";
  } else if (userAgent.contains("firefox")) {
    navegador = "Mozilla Firefox";
  } else if (userAgent.contains("safari") && !userAgent.contains("chrome")) {
    navegador = "Safari";
  } else if (userAgent.contains("msie") || userAgent.contains("trident")) {
    navegador = "Internet Explorer";
  } else if (userAgent.contains("chromium")) {
    navegador = "Chromium";
  }

  // Obtener la versión del navegador (esto es más complejo y podría requerir expresiones regulares específicas)
  String version = "Versión desconocida";

  // Mostrar la información en la consola
  print('Navegador detectado: $navegador');

  // También puedes retornar los valores si los necesitas en otra parte
  return {'navegador': navegador, 'userAgent': userAgent};
}

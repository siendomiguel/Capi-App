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

Future<dynamic> state2JSON(List<String> appState) async {
  // convertir una lista string a JSON añadiendo la palabra "description": al inicio de cada item
  List<Map<String, dynamic>> jsonList = [];

  for (String item in appState) {
    Map<String, dynamic> jsonItem = {"description": item};
    jsonList.add(jsonItem);
  }
  return jsonList;
}

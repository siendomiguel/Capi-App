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

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<String>> searchCIE10(String? text) async {
  // Verificar si el texto de búsqueda es válido
  if (text == null || text.isEmpty || text.length < 2) {
    return [];
  }

  try {
    // Primero obtener el token de acceso
    final tokenUrl = "https://icdaccessmanagement.who.int/connect/token";
    final clientId =
        "6d0d24a7-0d0b-447d-a5ce-86635ef1511e_996c6ea5-d1db-48ed-b6dc-f0f6bfce7f3b"; // Reemplazar con tus credenciales
    final clientSecret =
        "EBS430zK3wJ9JwC2LEJT6iOe6F1QxM96wQB1YT9gT1k="; // Reemplazar con tus credenciales

    final tokenResponse = await http.post(
      Uri.parse(tokenUrl),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        "client_id": clientId,
        "client_secret": clientSecret,
        "scope": "icdapi_access",
        "grant_type": "client_credentials",
      },
    );

    if (tokenResponse.statusCode != 200) {
      print("Error obteniendo token: ${tokenResponse.body}");
      return [];
    }

    final tokenData = json.decode(tokenResponse.body);
    final token = tokenData["access_token"];

    // Ahora hacer la llamada al endpoint de autocompletado
    final language = "es"; // Lenguaje para los resultados (español)
    final autocompleteUrl =
        "https://id.who.int/icd/release/11/2022-02/mms/autocomplete?q=${Uri.encodeComponent(text)}&language=$language";

    final response = await http.get(
      Uri.parse(autocompleteUrl),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
        "API-Version": "v2",
      },
    );

    if (response.statusCode != 200) {
      print("Error en la búsqueda: ${response.body}");
      return [];
    }

    // Procesar la respuesta y extraer las sugerencias
    final data = json.decode(response.body);
    List<String> suggestions = [];

    // La estructura exacta puede variar según la API, ajusta según sea necesario
    if (data != null && data['destinationEntities'] != null) {
      for (var item in data['destinationEntities']) {
        if (item['title'] != null) {
          suggestions.add(item['title']);
        }
      }
    }

    return suggestions;
  } catch (e) {
    print("Error en la función de búsqueda: $e");
    return [];
  }
}

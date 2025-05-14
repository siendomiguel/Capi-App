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

Future<List<CitasRecord>> busquedaPorDiaCitas(DateTime? daySelected) async {
  List<CitasRecord> citasList = [];

  // Verificar si se proporcionó una fecha válida
  if (daySelected == null) {
    print("No se proporcionó una fecha válida. Retornando lista vacía.");
    return citasList; // Retorna una lista vacía si no se proporciona una fecha
  }

  // Mostrar la fecha seleccionada en la consola
  print("Fecha seleccionada: $daySelected");

  // Normalizar la fecha seleccionada para que solo tenga día, mes y año (sin hora)
  DateTime fechaInicio =
      DateTime(daySelected.year, daySelected.month, daySelected.day);
  DateTime fechaFin = DateTime(
      daySelected.year, daySelected.month, daySelected.day, 23, 59, 59);

  // Mostrar las fechas de inicio y fin en la consola
  print("Fecha de inicio (inicio del día): $fechaInicio");
  print("Fecha de fin (fin del día): $fechaFin");

  // Realizar la consulta en Firestore para obtener las citas dentro del rango de fechas
  Query query = FirebaseFirestore.instance
      .collection('citas')
      .where('fechaCIta', isGreaterThanOrEqualTo: fechaInicio)
      .where('fechaCIta', isLessThanOrEqualTo: fechaFin);

  // Mostrar la consulta que se está realizando
  print(
      "Realizando consulta en Firestore para citas entre $fechaInicio y $fechaFin");

  // Obtener los documentos de la consulta
  QuerySnapshot querySnapshot = await query.get();

  // Mostrar la cantidad de documentos encontrados
  print("Número de citas encontradas: ${querySnapshot.docs.length}");

  // Recorrer los documentos y agregarlos a la lista
  for (var doc in querySnapshot.docs) {
    CitasRecord cita = CitasRecord.fromSnapshot(doc);
    citasList.add(cita);
  }

  // Mostrar la lista final de citas
  print("Lista final de citas: $citasList");

  return citasList;
}

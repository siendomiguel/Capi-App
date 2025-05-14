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

Future<List<UsersRecord>> busquedaPorServicioEspecialidadRoleYCiudad(
  DocumentReference? servicioSeleccionado, // Servicio que estás buscando
  DocumentReference?
      especialidadSeleccionada, // Especialidad que estás buscando
  String? ciudadSeleccionada, // Ciudad que estás buscando
) async {
  List<UsersRecord> usersList = [];

  // Obtener todos los usuarios con rol 'Doctor' y ciudad seleccionada desde Firestore
  Query query = FirebaseFirestore.instance
      .collection('users')
      .where('role', isEqualTo: 'Doctor');

  // Si se proporciona una ciudad, agregar un filtro para la ciudad
  if (ciudadSeleccionada != null && ciudadSeleccionada.isNotEmpty) {
    print(ciudadSeleccionada);
    query = query.where('ciudad', isEqualTo: ciudadSeleccionada.trim());
  }

  // Obtener los documentos de la consulta
  QuerySnapshot querySnapshot = await query.get();

  for (var doc in querySnapshot.docs) {
    UsersRecord user = UsersRecord.fromSnapshot(doc);

    // Verificar si hay filtros adicionales
    bool coincideServicio = servicioSeleccionado != null &&
        user.serviciosList.contains(servicioSeleccionado);

    bool coincideEspecialidad = especialidadSeleccionada != null &&
        user.especialidadList.contains(especialidadSeleccionada);

    // Lógica para agregar usuarios:
    // 1. Si no se especifican servicio ni especialidad, agrega el usuario filtrado por ciudad.
    if (servicioSeleccionado == null && especialidadSeleccionada == null) {
      usersList.add(user);
      continue; // Salta al siguiente usuario
    }

    // 2. Si se especifica al menos uno de los criterios adicionales, verificar coincidencias
    if (coincideServicio || coincideEspecialidad) {
      usersList.add(user);
    }
  }

  return usersList;
}

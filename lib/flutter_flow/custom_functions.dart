import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

double sumaIngresos(List<double>? listaPrecios) {
  double sum = 0;
  if (listaPrecios != null) {
    for (int i = 0; i < listaPrecios.length; i++) {
      sum += listaPrecios[i];
    }
  }
  return sum;
}

List<String> doctorConfOptions() {
  return [
    'Días de atención',
    //'Configuración de Pagos',
    //'Configuración de Zoom',
  ];
}

int sumaEnteros(List<int>? listado) {
  int sum = 0;
  if (listado != null) {
    for (int i = 0; i < listado.length; i++) {
      sum += listado[i];
    }
  }
  return sum;
}

int calcularEdad(DateTime fechaNacimiento) {
  DateTime fechaActual = DateTime.now();
  int edad = fechaActual.year - fechaNacimiento.year;

  if (fechaActual.month < fechaNacimiento.month ||
      (fechaActual.month == fechaNacimiento.month &&
          fechaActual.day < fechaNacimiento.day)) {
    edad--;
  }

  return edad;
}

List<String> asistConfOptions() {
  return [
    'Servicios',
    'Equipo',
  ];
}

String calculateICM(
  double peso,
  double talla,
) {
  // calcular indice de masa corporal
  double weight = peso; // in kilograms
  double height = talla; // in meters
  double bmi = weight / math.pow(height, 2);
  return bmi.toStringAsFixed(2);
}

List<AvailabilityStruct>? initialAvailability(
  int? horaInicio,
  int? horaFin,
) {
  final List<AvailabilityStruct> availability = [];
  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final currentYear = DateTime.now().year;

  // Si no vienen horas, usamos 9 AM a 5 PM por defecto
  final defaultStartTime = DateTime(currentYear, 1, 1, horaInicio ?? 9, 0);
  final defaultEndTime = DateTime(currentYear, 1, 1, horaFin ?? 17, 0);

  for (final day in daysOfWeek) {
    if (day == 'Saturday' || day == 'Sunday') {
      availability.add(
        AvailabilityStruct(
          dayofWeek: day,
          startTime: null,
          endTime: null,
        ),
      );
    } else {
      availability.add(
        AvailabilityStruct(
          dayofWeek: day,
          startTime: defaultStartTime,
          endTime: defaultEndTime,
        ),
      );
    }
  }

  return availability;
}

List<DateTime>? getAvailabileSlots(
  List<DateTime> bookings,
  DateTime dateArg,
  List<AvailabilityStruct>? availability,
  int timeBlocks,
) {
  try {
    print('Llamada a getAvailabileSlots con fecha seleccionada: $dateArg');

    // Validar availability null
    if (availability == null) {
      print('Advertencia: availability es null (se tratará como lista vacía)');
      return [];
    }

    // Resto de validaciones
    if (timeBlocks <= 0 || timeBlocks > 60) {
      throw ArgumentError('Bloques de tiempo inválidos: $timeBlocks minutos');
    }

    final dayFormatter = DateFormat('EEEE');
    List<AvailabilityStruct> matchingAvailability;

    try {
      // Filtrar disponibilidades por día (con null-safety)
      final currentWeekDay = dayFormatter.format(dateArg).toLowerCase();
      matchingAvailability = availability
          .where((a) => a.dayofWeek.toLowerCase() == currentWeekDay)
          .toList();

      print('Disponibilidades encontradas: ${matchingAvailability.length}');
    } catch (e) {
      print('Error al filtrar disponibilidades: $e');
      rethrow;
    }

    if (matchingAvailability.isEmpty) {
      print('No hay disponibilidad para $dateArg');
      return [];
    }

    final availableSlots = <DateTime>[];

    for (final a in matchingAvailability) {
      try {
        if (!a.hasStartTime() || !a.hasEndTime()) {
          print('Disponibilidad incompleta: ${a.dayofWeek}');
          continue;
        }

        final start = a.startTime!;
        final end = a.endTime!;
        print(
            'Procesando rango: ${start.hour}:${start.minute} - ${end.hour}:${end.minute}');

        // Validar rango horario
        if (start.isAfter(end)) {
          print('Error: Hora de inicio posterior a hora final');
          continue;
        }

        // Generar slots
        var currentHour = start.hour;
        var currentMinute = start.minute;

        while (currentHour < end.hour ||
            (currentHour == end.hour && currentMinute < end.minute)) {
          try {
            final slot = DateTime(dateArg.year, dateArg.month, dateArg.day,
                currentHour, currentMinute);

            availableSlots.add(slot);

            // Avanzar
            currentMinute += timeBlocks;
            if (currentMinute >= 60) {
              currentHour++;
              currentMinute %= 60;
            }
          } catch (e) {
            print('Error generando slot ($currentHour:$currentMinute): $e');
            break;
          }
        }
      } catch (e) {
        print('Error procesando disponibilidad: $e');
      }
    }

    // Filtrar slots ocupados
    final now = DateTime.now();
    final filteredSlots = availableSlots.where((slot) {
      final isAvailable = !bookings.any((b) =>
          b.year == slot.year &&
          b.month == slot.month &&
          b.day == slot.day &&
          b.hour == slot.hour &&
          b.minute == slot.minute);

      return isAvailable && slot.isAfter(now);
    }).toList();

    print('Slots disponibles finales: ${filteredSlots.length}');
    return filteredSlots;
  } catch (e, stackTrace) {
    print('ERROR CRÍTICO EN getAvailabileSlots: $e');
    print('Stack trace: $stackTrace');
    return null;
  }
}

DateTime? stringToTime(
  String? hourArg,
  DateTime? dateArg,
) {
  // output the combination of date from dateArg and hourArg (HH:mm format)
  if (hourArg == null || dateArg == null) {
    return null;
  }
  final hourMin = hourArg.split(':');
  final hour = int.tryParse(hourMin[0]);
  final minute = int.tryParse(hourMin[1]);
  if (hour == null || minute == null) {
    return null;
  }
  return DateTime(dateArg.year, dateArg.month, dateArg.day, hour, minute);
}

List<int>? estadisticasIngresos(List<CitasRecord>? citas) {
  // Verifica si la lista de citas es nula o está vacía
  if (citas == null || citas.isEmpty) {
    return null;
  }

  // Inicializa una lista de 12 elementos, cada uno representa un mes del año
  final List<int> stats = List.filled(12, 0);

  // Itera a través de cada cita
  for (final cita in citas) {
    // Obtiene el mes de la fecha de la cita
    final month = cita.fechaCIta!.month;

    // Redondea el precio y lo suma al total del mes correspondiente
    stats[month - 1] += cita.precio.round();
  }

  // Devuelve las estadísticas de ingresos por mes
  print(stats);
  return stats;
}

DocumentReference servicioRef(String servicioUID) {
  String documentoPath = "servicios/" + servicioUID;

  DocumentReference documentReference =
      FirebaseFirestore.instance.doc(documentoPath);
  return documentReference;
}

List<int>? estadisticasPacientes(List<UsersRecord>? pacientes) {
  // Verifica si la lista de citas es nula o está vacía
  if (pacientes == null || pacientes.isEmpty) {
    return null;
  }

  // Inicializa una lista de 12 elementos, cada uno representa un mes del año
  final List<int> stats = List.filled(12, 0);

  // Itera a través de cada cita
  for (final paciente in pacientes) {
    // Obtiene el mes de la fecha de la cita
    final month = paciente.createdTime!.month;

    // Incrementa el contador del mes correspondiente
    stats[month - 1]++;
  }

  // Devuelve las estadísticas de las citas por mes
  return stats;
}

List<ServiciosRecord>? serviciosDisponibles(
  List<UsersRecord>? doctor,
  List<ServiciosRecord>? allServicios,
) {
  // Retornar solo los documentos cuyas referencias estén en la especialidadList de los doctores
  if (doctor == null) {
    return null;
  }

  // Lista donde se agregarán las referencias de especialidades de los doctores
  Set<DocumentReference> serviciosRefs = {};

  // Iterar sobre cada doctor
  for (UsersRecord doctor in doctor) {
    if (doctor.serviciosList != null) {
      // Agregar las referencias de especialidad a la lista
      serviciosRefs.addAll(doctor.serviciosList!);
    }
  }

  // Si no hay referencias de especialidad, retornamos null
  if (serviciosRefs.isEmpty) {
    return null;
  }

  // Lista para almacenar las especialidades que coincidan con las referencias
  List<ServiciosRecord> servicios = [];

  // Filtrar los documentos de especialidad que coincidan con las referencias
  for (ServiciosRecord servicio in allServicios!) {
    if (serviciosRefs.contains(servicio.reference)) {
      servicios.add(servicio);
    }
  }

  // Retornamos la lista de especialidades, o null si no hay ninguna
  return servicios.isNotEmpty ? servicios : null;
}

List<String> userRoleConfOptions(
  Roles? rol,
  bool? isAdmin,
) {
  print(rol);
  if (isAdmin == true) {
    return [
      'General',
      'Días de atención',
      'Servicios',
      'Configuración de Pagos',
      'Configuración de Zoom',
      'Equipo',
    ];
  } else if (isAdmin == false && rol == Roles.Doctor) {
    return [
      'Días de atención',
    ];
  } else if (isAdmin == false && rol == Roles.Asistente) {
    return [
      'Servicios',
      'Equipo',
    ];
  }

  return []; // Siempre devuelve algo al final
}

int? calcularPacientesRestantes(
  int? limite,
  int? creados,
) {
  // limite - creados
  if (limite == null || creados == null) {
    return null;
  }
  return limite - creados;
}

double? citasEstadisticas(
  List<CitasRecord>? citas,
  String? periodo,
) {
  // calcular  cantidad citas dependiendo el periodo que puede ser Mes Semana Año
  if (citas == null || citas.isEmpty || periodo == null) {
    return null;
  }

  final now = DateTime.now();
  final formatter = DateFormat('yyyy-MM-dd');

  switch (periodo) {
    case 'Mes':
      final startOfMonth = DateTime(now.year, now.month, 1);
      final endOfMonth = DateTime(now.year, now.month + 1, 0);
      final filteredCitas = citas.where((cita) {
        return cita.fechaCIta!.isAfter(startOfMonth) &&
            cita.fechaCIta!.isBefore(endOfMonth);
      }).toList();
      return filteredCitas.length.toDouble();
    case 'Semana':
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
      final endOfWeek = startOfWeek.add(Duration(days: 6));
      final filteredCitas = citas.where((cita) {
        return cita.fechaCIta!.isAfter(startOfWeek) &&
            cita.fechaCIta!.isBefore(endOfWeek);
      }).toList();
      return filteredCitas.length.toDouble();
    case 'Año':
      final startOfYear = DateTime(now.year, 1, 1);
      final endOfYear = DateTime(now.year + 1, 1, 0);
      final filteredCitas = citas.where((cita) {
        return cita.fechaCIta!.isAfter(startOfYear) &&
            cita.fechaCIta!.isBefore(endOfYear);
      }).toList();
      return filteredCitas.length.toDouble();
    default:
      return null;
  }
}

List<String>? diasLaborales(List<AvailabilityStruct>? dias) {
  // Devolver una lista de días de la semana solo si se establece una hora de inicio
  if (dias == null) {
    return null;
  }
  final startTimeSet = dias.any((dia) => dia.startTime != null);
  if (!startTimeSet) {
    return null;
  }
  return dias.where((dia) => dia.startTime != null).map((dia) {
    switch (dia.dayofWeek) {
      case "Monday":
        return "Lunes";
      case "Tuesday":
        return "Martes";
      case "Wednesday":
        return "Miércoles";
      case "Thursday":
        return "Jueves";
      case "Friday":
        return "Viernes";
      case "Saturday":
        return "Sábado";
      case "Sunday":
        return "Domingo";
      default:
        return dia
            .dayofWeek; // Si el día no es reconocido, se devuelve como está
    }
  }).toList();
}

DateTime? convertSlots(String? slots) {
  // Si la cadena es nula, retornamos null
  if (slots == null) {
    return null;
  }

  // Definimos el formato esperado para la hora
  final format = DateFormat('HH:mm');
  try {
    // Parseamos la cadena de hora
    final time = format.parse(slots);

    // Obtenemos la fecha actual
    final now = DateTime.now();

    // Construimos un nuevo objeto DateTime con la fecha actual y la hora parseada
    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);

    return dateTime;
  } catch (e) {
    // En caso de error, retornamos null
    return null;
  }
}

List<int>? estadisticasCitas(List<CitasRecord>? citas) {
  // Verifica si la lista de citas es nula o está vacía
  if (citas == null || citas.isEmpty) {
    return null;
  }

  // Inicializa una lista de 12 elementos, cada uno representa un mes del año
  final List<int> stats = List.filled(12, 0);

  // Itera a través de cada cita
  for (final cita in citas) {
    // Obtiene el mes de la fecha de la cita
    final month = cita.fechaCIta!.month;

    // Incrementa el contador del mes correspondiente
    stats[month - 1]++;
  }

  // Devuelve las estadísticas de las citas por mes
  return stats;
}

List<DocumentReference>? listaEspecialidadesDoc(
  List<EspecialidadRecord>? servicio,
  List<String>? especialidadesSeleccionadas,
) {
  if (servicio == null || especialidadesSeleccionadas == null) {
    return null;
  }

  final List<DocumentReference> references = [];

  for (final servicio in servicio) {
    if (especialidadesSeleccionadas.contains(servicio.nombre)) {
      references.add(servicio.reference);
    }
  }

  return references;
}

List<DocumentReference>? deleteUserList(List<DocumentReference>? mienbros) {
  // eliminar miembros duplicados
  if (mienbros == null) {
    return null;
  }
  final uniqueMembers = <DocumentReference>{};
  for (final member in mienbros) {
    uniqueMembers.add(member);
  }
  return uniqueMembers.toList();
}

double? ingresosEstadisticas(
  List<CitasRecord>? citas,
  String? periodo,
) {
  // calcular  ingresos totales depandiendo el periodo que puede ser mes semana año
  if (citas == null || citas.isEmpty || periodo == null) {
    return null;
  }

  double totalIngresos = 0.0;

  switch (periodo) {
    case 'Mes':
      final now = DateTime.now();
      final firstDayOfMonth = DateTime(now.year, now.month, 1);
      final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);

      for (final cita in citas) {
        final citaDate = cita.fechaCIta;
        if (citaDate!.isAfter(firstDayOfMonth) &&
            citaDate.isBefore(lastDayOfMonth)) {
          totalIngresos += cita.precio;
        }
      }
      break;
    case 'Semana':
      final now = DateTime.now();
      final firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
      final lastDayOfWeek = firstDayOfWeek.add(Duration(days: 6));

      for (final cita in citas) {
        final citaDate = cita.fechaCIta;
        if (citaDate!.isAfter(firstDayOfWeek) &&
            citaDate.isBefore(lastDayOfWeek)) {
          totalIngresos += cita.precio;
        }
      }
      break;
    case 'Año':
      final now = DateTime.now();
      final firstDayOfYear = DateTime(now.year, 1, 1);
      final lastDayOfYear = DateTime(now.year, 12, 31);

      for (final cita in citas) {
        final citaDate = cita.fechaCIta;
        if (citaDate!.isAfter(firstDayOfYear) &&
            citaDate.isBefore(lastDayOfYear)) {
          totalIngresos += cita.precio;
        }
      }
      break;
    default:
      return null;
  }

  return totalIngresos;
}

double? pacientesEstadisticas(
  List<UsersRecord>? pacientes,
  String? periodo,
) {
  //  calcular  pacientes totales depandiendo el periodo que puede ser Mes Semana Año
  if (pacientes == null || pacientes.isEmpty || periodo == null) {
    return null;
  }

  final now = DateTime.now();
  final start = periodo == 'Mes'
      ? DateTime(now.year, now.month, 1)
      : periodo == 'Semana'
          ? now.subtract(Duration(days: now.weekday - 1))
          : DateTime(now.year, 1, 1);

  final filteredPacientes = pacientes.where((paciente) {
    final createdAt = paciente.createdTime;
    return createdAt != null && createdAt.isAfter(start);
  }).toList();

  return filteredPacientes.length.toDouble();
}

List<DocumentReference>? listaServiciosDoc(
  List<ServiciosRecord>? servicios,
  List<String>? servicioseleccionados,
) {
  if (servicios == null || servicioseleccionados == null) {
    return null;
  }

  final List<DocumentReference> references = [];

  for (final servicio in servicios) {
    if (servicioseleccionados.contains(servicio.nombreServicio)) {
      references.add(servicio.reference);
    }
  }

  return references;
}

DateTime? parseFechaNacimiento(String? fecha) {
  // convertir fecha en date time el formato que ingresa por el parametro es 13/01/1986
  if (fecha == null) return null;
  final format = DateFormat('dd/MM/yyyy');
  return format.parse(fecha);
}

List<String>? formatearString(List<String>? nombre) {
  if (nombre == null) {
    return null;
  }

  // Formatear los nombres con la primera letra en mayúscula y el resto en minúsculas
  List<String> formattedNames = nombre.map((name) {
    if (name.isEmpty) {
      return name;
    }
    return name[0].toUpperCase() + name.substring(1).toLowerCase();
  }).toList();

  // Ordenar alfabéticamente
  formattedNames.sort();

  return formattedNames;
}

List<String>? parsearEspecialidad(List<EspecialidadRecord>? especialidades) {
  // retornar lista con nombre de especialidades
  if (especialidades == null || especialidades.isEmpty) {
    return null;
  }

  List<String> nombresEspecialidades =
      especialidades.map((e) => e.nombre).toList();
  return nombresEspecialidades;
}

DocumentReference especialidadRef(String especialidadUID) {
  String documentoPath = "especialidad/" + especialidadUID;

  DocumentReference documentReference =
      FirebaseFirestore.instance.doc(documentoPath);
  return documentReference;
}

List<String>? mostrarSoloCuidadesConDoctores(List<UsersRecord>? doctores) {
  // retornar las ciudad donde los doctores tengan cargada ciudad en la collection users  sin que se repitan
  if (doctores == null || doctores.isEmpty) {
    return null;
  }

  Set<String> cities = {};
  for (UsersRecord doctor in doctores) {
    if (doctor.ciudad.isNotEmpty) {
      cities.add(doctor.ciudad);
    }
  }

  return cities.toList();
}

List<EspecialidadRecord>? especialidadesDisponibles(
  List<UsersRecord>? doctor,
  List<EspecialidadRecord>? allEspecialidades,
) {
  // Retornar solo los documentos cuyas referencias estén en la especialidadList de los doctores
  if (doctor == null) {
    return null;
  }

  // Lista donde se agregarán las referencias de especialidades de los doctores
  Set<DocumentReference> especialidadesRefs = {};

  // Iterar sobre cada doctor
  for (UsersRecord doctor in doctor) {
    if (doctor.especialidadList != null) {
      // Agregar las referencias de especialidad a la lista
      especialidadesRefs.addAll(doctor.especialidadList!);
    }
  }

  // Si no hay referencias de especialidad, retornamos null
  if (especialidadesRefs.isEmpty) {
    return null;
  }

  // Lista para almacenar las especialidades que coincidan con las referencias
  List<EspecialidadRecord> especialidades = [];

  // Filtrar los documentos de especialidad que coincidan con las referencias
  for (EspecialidadRecord especialidad in allEspecialidades!) {
    if (especialidadesRefs.contains(especialidad.reference)) {
      especialidades.add(especialidad);
    }
  }

  // Retornamos la lista de especialidades, o null si no hay ninguna
  return especialidades.isNotEmpty ? especialidades : null;
}

double calcCostosAI(
  int tokens,
  double price,
) {
  double cost = (tokens / 1000) * price;
  return cost;
}

double calcSaldoCreditos(
  double credits,
  double gasto,
) {
  double creditsNow = credits - gasto;
  return creditsNow;
}

DateTime? convertSlotsTest(
  String? slots,
  DateTime selectedDate,
) {
  if (slots == null) {
    return null;
  }

  final format = DateFormat('HH:mm');
  try {
    final time = format.parse(slots);

    // En lugar de usar DateTime.now(), usamos la fecha seleccionada
    final dateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      time.hour,
      time.minute,
    );

    return dateTime;
  } catch (e) {
    return null;
  }
}

String replaceText(
  String keyStripe,
  String chekcoutKey,
) {
  return '''
  <!DOCTYPE html>
<html>
  <head>
    <script src="https://js.stripe.com/v3/"></script>
  </head>
  <body>
    <h1>Stripe Checkout</h1>
    <div id="checkout-container"></div>

    <script>
      // Replace with your actual Stripe publishable key
      const stripe = Stripe('${keyStripe}');

      // Client secret from the checkout session payload
      const clientSecret = '${chekcoutKey}';

      // Initialize Checkout
      stripe.initEmbeddedCheckout({
        clientSecret: clientSecret
      }).then(function(checkout) {
        // Mount the checkout form to the DOM
        checkout.mount('#checkout-container');
      }).catch(function(error) {
        console.error('Error initializing Checkout:', error);
      });
    </script>
  </body>
</html>
''';
}

bool? compareID(
  List<dynamic> listData,
  String idUser,
) {
  return listData.any((item) => item['id'] == idUser);
}

String? obtenerPrimerElementoMenu(
  List<String>? listaItemsMenu,
  String? avanceMenuUsuario,
) {
  print('listaItemsMenu: $listaItemsMenu');

  if ((avanceMenuUsuario ?? '').isNotEmpty) {
    if (listaItemsMenu != null && listaItemsMenu.isNotEmpty) {
      final index = listaItemsMenu.indexOf(avanceMenuUsuario!);

      if (index != -1 && index + 1 < listaItemsMenu.length) {
        // Existe un siguiente elemento
        print('Siguiente elemento: ${listaItemsMenu[index + 1]}');
        return listaItemsMenu[index + 1];
      } else {
        // No hay siguiente, retorna el mismo avanceMenuUsuario
        print('No hay siguiente, retorno el mismo: $avanceMenuUsuario');
        return avanceMenuUsuario;
      }
    } else {
      // listaItemsMenu es null o vacía, no se puede buscar
      print('Lista vacía, retorno avanceMenuUsuario: $avanceMenuUsuario');
      return avanceMenuUsuario;
    }
  }

  if (listaItemsMenu == null || listaItemsMenu.isEmpty) {
    return null;
  }

  print('Retorno primer elemento: ${listaItemsMenu.first}');
  return listaItemsMenu.first;
}

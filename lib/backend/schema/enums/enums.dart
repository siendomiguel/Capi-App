import 'package:collection/collection.dart';

enum TipoProfesional {
  Administrador,
  Invitado,
}

enum Roles {
  Doctor,
  Asistente,
  Paciente,
}

enum EtapaIncorporacion {
  inicio_01,
  completoPerfil_02,
  configuroNegocio_03,
  adquirioSuscripcion_04,
  aceptoInvitacion_05,
  bloqueado_06,
  eliminoCuenta_07,
  autoInvitado_08,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (TipoProfesional):
      return TipoProfesional.values.deserialize(value) as T?;
    case (Roles):
      return Roles.values.deserialize(value) as T?;
    case (EtapaIncorporacion):
      return EtapaIncorporacion.values.deserialize(value) as T?;
    default:
      return null;
  }
}

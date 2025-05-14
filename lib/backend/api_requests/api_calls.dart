import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ff';

/// Start stripeSuscriptions Group Code

class StripeSuscriptionsGroup {
  static String getBaseUrl({
    String? skStripe = 'hola',
  }) =>
      'https://api.stripe.com/v1';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [sk_stripe]',
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  static CreateCustomerCall createCustomerCall = CreateCustomerCall();
  static CreateCheckoutSessionsCall createCheckoutSessionsCall =
      CreateCheckoutSessionsCall();
  static PaymentCheckoutSessionsCall paymentCheckoutSessionsCall =
      PaymentCheckoutSessionsCall();
  static CustomerPortalCall customerPortalCall = CustomerPortalCall();
  static ConsultaSuscripcionActivaCall consultaSuscripcionActivaCall =
      ConsultaSuscripcionActivaCall();
}

class CreateCustomerCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? skStripe = 'hola',
  }) async {
    final baseUrl = StripeSuscriptionsGroup.getBaseUrl(
      skStripe: skStripe,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'createCustomer',
      apiUrl: '${baseUrl}/customers',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${skStripe}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'email': email,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? stripeCustid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class CreateCheckoutSessionsCall {
  Future<ApiCallResponse> call({
    String? customer = '',
    String? successUrl = '',
    String? cancelUrl = '',
    String? price = '',
    String? skStripe = 'hola',
  }) async {
    final baseUrl = StripeSuscriptionsGroup.getBaseUrl(
      skStripe: skStripe,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'createCheckoutSessions',
      apiUrl: '${baseUrl}/checkout/sessions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${skStripe}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'mode': "subscription",
        'success_url': successUrl,
        'cancel_url': cancelUrl,
        'line_items[0][price]': price,
        'line_items[0][quantity]': "1",
        'customer': customer,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
}

class PaymentCheckoutSessionsCall {
  Future<ApiCallResponse> call({
    String? customerEmail = '',
    String? successUrl = '',
    String? cancelUrl = '',
    String? price = '',
    String? currency = '',
    String? productName = '',
    String? productDescription = '',
    String? skStripe = 'hola',
  }) async {
    final baseUrl = StripeSuscriptionsGroup.getBaseUrl(
      skStripe: skStripe,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'paymentCheckoutSessions',
      apiUrl: '${baseUrl}/checkout/sessions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${skStripe}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'mode': "payment",
        'success_url': successUrl,
        'cancel_url': cancelUrl,
        'line_items[0][price_data][unit_amount]': price,
        'line_items[0][quantity]': "1",
        'customer_email': customerEmail,
        'line_items[0][price_data][currency]': currency,
        'line_items[0][price_data][product_data][name]': productName,
        'line_items[0][price_data][product_data][description]':
            productDescription,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
}

class CustomerPortalCall {
  Future<ApiCallResponse> call({
    String? customer = '',
    String? skStripe = 'hola',
  }) async {
    final baseUrl = StripeSuscriptionsGroup.getBaseUrl(
      skStripe: skStripe,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'customerPortal',
      apiUrl: '${baseUrl}/billing_portal/sessions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${skStripe}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'customer': customer,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? portalURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
}

class ConsultaSuscripcionActivaCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? skStripe = 'hola',
  }) async {
    final baseUrl = StripeSuscriptionsGroup.getBaseUrl(
      skStripe: skStripe,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Consulta  Suscripcion activa',
      apiUrl: '${baseUrl}/subscriptions/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${skStripe}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? statusPlan(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.items.data[:].plan.active''',
      ));
}

/// End stripeSuscriptions Group Code

/// Start EmailsResend Group Code

class EmailsResendGroup {
  static String getBaseUrl() => 'https://capi-email.up.railway.app';
  static Map<String, String> headers = {};
  static NuevoPacienteCall nuevoPacienteCall = NuevoPacienteCall();
  static NuevaConsultaCall nuevaConsultaCall = NuevaConsultaCall();
  static ModificacionConsultaCall modificacionConsultaCall =
      ModificacionConsultaCall();
  static EnvoDeCorreoParaConsultaDelDoctorCall
      envoDeCorreoParaConsultaDelDoctorCall =
      EnvoDeCorreoParaConsultaDelDoctorCall();
  static NuevaSolicitudDeContactoCall nuevaSolicitudDeContactoCall =
      NuevaSolicitudDeContactoCall();
  static CancelacionDeCitaCall cancelacionDeCitaCall = CancelacionDeCitaCall();
  static ConsultaConfirmadaCall consultaConfirmadaCall =
      ConsultaConfirmadaCall();
  static CancelarCitaDoctorCall cancelarCitaDoctorCall =
      CancelarCitaDoctorCall();
  static BienvenidoACapiCall bienvenidoACapiCall = BienvenidoACapiCall();
}

class NuevoPacienteCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? urlApp = '',
    String? patientName = '',
    String? patientEmail = '',
  }) async {
    final baseUrl = EmailsResendGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "from": "Capi No Reply <noreply@doctorcapi.com>",
  "to": "${to}",
  "subject": "${subject}",
  "urlApp": "${urlApp}",
  "patientName": "${patientName}",
  "patientEmail": "${patientEmail}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Nuevo Paciente',
      apiUrl: '${baseUrl}/api/emails/patients',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NuevaConsultaCall {
  Future<ApiCallResponse> call({
    String? from = '',
    String? to = '',
    String? subject = '',
    String? appointmentsLink = '',
    String? patientName = '',
    String? consultationType = '',
    String? date = '',
    String? time = '',
  }) async {
    final baseUrl = EmailsResendGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "from": "Capi No Reply <noreply@doctorcapi.com>",
  "to": "${to}",
  "subject": "${subject}",
  "appointmentsLink": "${appointmentsLink}",
  "patientName": "${patientName}",
  "consultationType": "${consultationType}",
  "date": "${date}",
  "time": "${time}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Nueva consulta',
      apiUrl: '${baseUrl}/api/emails/appointments',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModificacionConsultaCall {
  Future<ApiCallResponse> call({
    String? from = '',
    String? to = '',
    String? subject = '',
    String? appointmentLink = '',
    String? patientName = '',
    String? consultationType = '',
    String? newDate = '',
    String? newTime = '',
  }) async {
    final baseUrl = EmailsResendGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "from": "Capi No Reply <noreply@doctorcapi.com>",
  "to": "${to}",
  "subject": "${subject}",
  "appointmentsLink": "<appointmentsLink>",
  "patientName": "${patientName}",
  "consultationType": "${consultationType}",
  "newDate": "${newDate}",
  "newTime": "${newTime}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Modificacion consulta',
      apiUrl: '${baseUrl}/api/emails/appointments',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EnvoDeCorreoParaConsultaDelDoctorCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? link = '',
    String? paciente = '',
    String? tipConsulta = '',
    String? date = '',
    String? hora = '',
  }) async {
    final baseUrl = EmailsResendGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "from": "Capi No Reply <noreply@doctorcapi.com>",
  "to": "${to}",
  "subject": "Nueva Consulta Asignada",
  "appointmentsLink": "${link}",
  "patientName": "${paciente}",
  "consultationType": "${tipConsulta}",
  "date": "${date}",
  "time": "${hora}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Envo de correo para Consulta del Doctor',
      apiUrl: '${baseUrl}/api/emails/doctor-appointment',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NuevaSolicitudDeContactoCall {
  Future<ApiCallResponse> call({
    String? from = '',
    String? to = '',
    String? link = '',
    String? paciente = '',
    String? doctor = '',
  }) async {
    final baseUrl = EmailsResendGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "from": "Capi No Reply <noreply@doctorcapi.com>",
  "to": "${to}",
  "subject": "Nueva solicitud de conctacto",
  "appointmentsLink": "${link}",
  "patientName": "${paciente}",
  "doctorName": "${doctor}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Nueva solicitud de contacto',
      apiUrl: '${baseUrl}/api/emails/request-consultation-appointment',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelacionDeCitaCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? rescheduleUrl = '',
    String? patientName = '',
    String? date = '',
    String? time = '',
    String? consultationType = '',
  }) async {
    final baseUrl = EmailsResendGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "from": "Capi No Reply <noreply@doctorcapi.com>",
  "to": "${escapeStringForJson(to)}",
  "subject": "${escapeStringForJson(subject)}",
  "rescheduleUrl": "${escapeStringForJson(rescheduleUrl)}",
  "patientName": "${escapeStringForJson(patientName)}",
  "consultationType": "${escapeStringForJson(consultationType)}",
  "date": "${escapeStringForJson(date)}",
  "time": "${escapeStringForJson(time)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Cancelacion de Cita',
      apiUrl: '${baseUrl}/api/emails/cancel-appointment',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ConsultaConfirmadaCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? appointmentsLink = '',
    String? patientName = '',
    String? consultationType = '',
    String? date = '',
    String? time = '',
  }) async {
    final baseUrl = EmailsResendGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "from": "Capi No Reply <noreply@doctorcapi.com>",
  "to": "${escapeStringForJson(to)}",
  "subject": "${escapeStringForJson(subject)}",
  "appointmentsLink": "${escapeStringForJson(appointmentsLink)}",
  "patientName": "${escapeStringForJson(patientName)}",
  "consultationType": "${escapeStringForJson(consultationType)}",
  "date": "${escapeStringForJson(date)}",
  "time": "${escapeStringForJson(time)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'consulta confirmada',
      apiUrl: '${baseUrl}/api/emails/confirmed-appointment',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CancelarCitaDoctorCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? subject = '',
    String? rescheduleUrl = '',
    String? patientName = '',
  }) async {
    final baseUrl = EmailsResendGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "from": "Capi No Reply <noreply@doctorcapi.com>",
  "to": "${escapeStringForJson(to)}",
  "subject": "${escapeStringForJson(subject)}",
  "rescheduleUrl": "${escapeStringForJson(rescheduleUrl)}",
  "patientName": "${escapeStringForJson(patientName)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Cancelar cita doctor',
      apiUrl: '${baseUrl}/api/emails/cancel-appointment-doctor',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BienvenidoACapiCall {
  Future<ApiCallResponse> call({
    String? to = '',
    String? userName = '',
  }) async {
    final baseUrl = EmailsResendGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "from": "Capi No Reply <noreply@doctorcapi.com>",
  "to": "${escapeStringForJson(to)}",
  "subject": "¡Bienvenido a Capi!",
  "userName": "${escapeStringForJson(userName)}",
  "welcomeLink": "https://app.doctorcapi.com/"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'Bienvenido a Capi',
      apiUrl: '${baseUrl}/api/emails/send-welcome-email',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End EmailsResend Group Code

class CreateZoomLinkCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? anfitrion = '',
    String? invitado = '',
    String? fechaCita = '',
    String? tituloCita = '',
    String? pacienteName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "agenda": "${tituloCita}",
  "default_password": false,
  "duration": 60,
  "password": "123456",
  "pre_schedule": false,
  "recurrence": {
    "end_date_time": "${fechaCita}",
    "end_times": 7,
    "monthly_day": 1,
    "monthly_week": 1,
    "monthly_week_day": 1,
    "repeat_interval": 1,
    "type": 1,
    "weekly_days": "1"
  },
  "schedule_for": "${anfitrion}",
  "settings": {
    "additional_data_center_regions": [
      "TY"
    ],
    "allow_multiple_devices": true,
    "alternative_hosts_email_notification": true,
    "approval_type": 2,
    "approved_or_denied_countries_or_regions": {
      "approved_list": [
        "CX"
      ],
      "denied_list": [
        ""
      ],
      "enable": true,
      "method": "approve"
    },
    "audio": "telephony",
    "audio_conference_info": "test",
    "authentication_domains": "example.com",
    "authentication_exception": [
      {
        "email": "jchill@example.com",
        "name": "Jill Chill"
      }
    ],
    "auto_recording": "cloud",
    "breakout_room": {
      "enable": true,
      "rooms": [
        {
          "name": "room1",
          "participants": [
            "${invitado}"
          ]
        }
      ]
    },
    "calendar_type": 1,
    "close_registration": false,
    "contact_email": "${invitado}",
    "contact_name": "${pacienteName}",
    "email_notification": true,
    "encryption_type": "enhanced_encryption",
    "focus_mode": true,
    "host_video": true,
    "jbh_time": 0,
    "join_before_host": true,
    "language_interpretation": {
      "enable": true,
      "interpreters": [
        {
          "email": "interpreter@example.com",
          "languages": "US,FR"
        }
      ]
    },
    "sign_language_interpretation": {
      "enable": true,
      "interpreters": [
        {
          "email": "interpreter@example.com",
          "sign_language": "American"
        }
      ]
    },
    "meeting_authentication": true,
    "meeting_invitees": [
      {
        "email": "${invitado}"
      }
    ],
    "mute_upon_entry": false,
    "participant_video": false,
    "private_meeting": false,
    "registrants_confirmation_email": true,
    "registrants_email_notification": true,
    "registration_type": 1,
    "show_share_button": true,
    "use_pmi": false,
    "waiting_room": false,
    "watermark": false,
    "host_save_video_order": true,
    "alternative_host_update_polls": true,
    "internal_meeting": false,
    "continuous_meeting_chat": {
      "enable": true,
      "auto_add_invited_external_users": true
    },
    "participant_focused_meeting": false,
    "push_change_to_calendar": false,
    "resources": [
      {
        "resource_type": "whiteboard",
        "resource_id": "X4Hy02w3QUOdskKofgb9Jg",
        "permission_level": "editor"
      }
    ],
    "auto_start_meeting_summary": false,
    "auto_start_ai_companion_questions": false
  },
  "start_time": "${fechaCita}",
  "template_id": "Dv4YdINdTk+Z5RToadh5ug==",
  "timezone": "America/Bogota",
  "topic": "${tituloCita}",
  "tracking_fields": [
    {
      "field": "field1",
      "value": "value1"
    }
  ],
  "type": 2
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createZoomLink',
      apiUrl: 'https://api.zoom.us/v2/users/me/meetings',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? zoomLink(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.start_url''',
      ));
}

class ZoomTokenCall {
  static Future<ApiCallResponse> call({
    String? accID = '',
    String? authKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'zoomToken',
      apiUrl:
          'https://zoom.us/oauth/token?grant_type=account_credentials&account_id=${accID}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic ${authKey}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? accessToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
}

class CrearPDFCall {
  static Future<ApiCallResponse> call({
    String? fecha = '',
    String? email = '',
    dynamic prescripcionJson,
    String? paciente = '',
    String? doctor = '',
    String? emailDoctor = '',
  }) async {
    final prescripcion = _serializeJson(prescripcionJson);
    final ffApiRequestBody = '''
{
  "template_id": "3e777b230009bbf2",
  "export_type": "json",
  "expiration": 10,
  "output_file": "my_new.pdf",
  "data": {
    "date": "${fecha}",
    "company_name": "${doctor}",
    "email": "${email}",
    "client": "${paciente}",
    "client_address2": "${emailDoctor}",
    "items": ${prescripcion}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'crearPDF',
      apiUrl: 'https://api.craftmypdf.com/v1/create',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-API-KEY': '40e2MTEzMzA6MTEzNzk6aTNJVXRKdVZBVXBRbzRlVQ=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.file''',
      ));
}

class StripeCheckoutPaymentCall {
  static Future<ApiCallResponse> call({
    String? skTest =
        'sk_test_51IYCM5Lkd8MOQEviMU396VWvLyZMieIG2iPsCfWsAUOzloMOUg0smhB7AHArgfOxPIHuE77Dbr2OvlMuPkkkcwk100Qzg5tYeW',
    String? successUrl = '',
    String? cancelUrl = '',
    double? price,
    String? customerEmail = '',
    String? currency = '',
    String? productName = '',
    String? productDescription = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Stripe Checkout Payment',
      apiUrl: 'https://api.stripe.com/v1/checkout/sessions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${skTest}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'mode': "payment",
        'success_url': successUrl,
        'cancel_url': cancelUrl,
        'line_items[0][price_data][unit_amount]': price,
        'line_items[0][quantity]': 1,
        'customer_email': customerEmail,
        'line_items[0][price_data][currency]': currency,
        'line_items[0][price_data][product_data][name]': productName,
        'line_items[0][price_data][product_data][description]':
            productDescription,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? checkoutURL(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class StripeCheckoutPaymentCopyCall {
  static Future<ApiCallResponse> call({
    String? skTest =
        'sk_test_51IYCM5Lkd8MOQEviMU396VWvLyZMieIG2iPsCfWsAUOzloMOUg0smhB7AHArgfOxPIHuE77Dbr2OvlMuPkkkcwk100Qzg5tYeW',
    String? successUrl = '',
    String? cancelUrl = '',
    double? price,
    String? customerEmail = '',
    String? currency = '',
    String? productName = '',
    String? productDescription = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Stripe Checkout Payment Copy',
      apiUrl: 'https://api.stripe.com/v1/checkout/sessions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${skTest}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'mode': "payment",
        'return_url': successUrl,
        'line_items[0][price_data][unit_amount]': price,
        'line_items[0][quantity]': 1,
        'customer_email': customerEmail,
        'line_items[0][price_data][currency]': currency,
        'line_items[0][price_data][product_data][name]': productName,
        'line_items[0][price_data][product_data][description]':
            productDescription,
        'ui_mode': "embedded",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? checkoutURL(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? checkoutSecret(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.client_secret''',
      ));
}

class StripeCheckoutConnectCall {
  static Future<ApiCallResponse> call({
    String? successUrl = '',
    String? cancelUrl = '',
    double? price,
    String? customerEmail = '',
    String? currency = '',
    String? productName = '',
    String? productDescription = '',
    String? connectedAcct = '',
    String? skToken =
        'sk_test_51P5xUwDqyTvyz5vL5phy3XuCNLktgTDKAeZovZHH0dxv4M20VHSZJ9hodi6sOd6wnmIGx8eAQGYQqFCk9jwJ2tEF00ewIYvMxf',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Stripe Checkout Connect',
      apiUrl: 'https://api.stripe.com/v1/checkout/sessions',
      callType: ApiCallType.POST,
      headers: {
        'Stripe-Account': '${connectedAcct}',
        'Authorization': 'Bearer ${skToken}',
      },
      params: {
        'cancel_url': cancelUrl,
        'success_url': successUrl,
        'line_items[0][price_data][unit_amount]': price,
        'line_items[0][quantity]': 1,
        'customer_email': customerEmail,
        'line_items[0][price_data][currency]': currency,
        'line_items[0][price_data][product_data][name]': productName,
        'line_items[0][price_data][product_data][description]':
            productDescription,
        'mode': "payment",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? checkoutURL(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? checkoutSecret(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.client_secret''',
      ));
}

class AssistantTestCall {
  static Future<ApiCallResponse> call({
    String? message = '',
    String? threadId = '',
    String? userId = '',
    String? assistantId = '',
    String? doctorId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "message": "${message}",
  "threadId": "${threadId}",
  "userID": "${userId}",
  "assistantId": "${assistantId}",
  "doctorId": "${doctorId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Assistant Test',
      apiUrl:
          'https://gpt-functions-development.up.railway.app/api/v1/assistant',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? allResponse(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response''',
      ));
  static String? responseAssistant(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.response.response''',
      ));
  static dynamic tokens(dynamic response) => getJsonField(
        response,
        r'''$.response.tokens''',
      );
  static int? totalTokens(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.response.tokens.total_tokens''',
      ));
}

class CreateThreadIDCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Create Thread ID',
      apiUrl:
          'https://gpt-functions-development.up.railway.app/api/v1/create-thread',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? threadId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.threadId''',
      ));
}

class GeneratePDFCall {
  static Future<ApiCallResponse> call({
    String? logoUrl = '',
    String? nombreMedico = '',
    String? nombrePaciente = '',
    String? edadPaciente = '',
    String? fechaConsulta = '',
    String? telefono = '',
    String? direccion = '',
    List<String>? certificadoPorList,
    List<String>? cedulasList,
    List<String>? medicamentosList,
  }) async {
    final certificadoPor = _serializeList(certificadoPorList);
    final cedulas = _serializeList(cedulasList);
    final medicamentos = _serializeList(medicamentosList);

    final ffApiRequestBody = '''
{
  "logoUrl": "${escapeStringForJson(logoUrl)}",
  "nombreMedico": "${escapeStringForJson(nombreMedico)}",
  "nombrePaciente": "${escapeStringForJson(nombrePaciente)}",
  "edadPaciente": "${escapeStringForJson(edadPaciente)}",
  "fechaConsulta": "${escapeStringForJson(fechaConsulta)}",
  "telefono": "${escapeStringForJson(telefono)}",
  "direccion": "${escapeStringForJson(direccion)}",
  "certificadoPor": ${certificadoPor},
  "cedulas": ${cedulas},
  "medicamentos": ${medicamentos}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate PDF',
      apiUrl: 'https://pdf-generate-production.up.railway.app/api/generate-pdf',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? result(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? pdfBase64(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.pdfBase64''',
      ));
}

class RevokeAuthStripeConnectCall {
  static Future<ApiCallResponse> call({
    String? stripeUserId = '',
    String? skToken =
        'sk_test_51P5xUwDqyTvyz5vL5phy3XuCNLktgTDKAeZovZHH0dxv4M20VHSZJ9hodi6sOd6wnmIGx8eAQGYQqFCk9jwJ2tEF00ewIYvMxf',
    String? clientId = 'ca_SBvFpJHr3eoUqzAVl1ACSpl1MIqe9yfJ',
  }) async {
    final ffApiRequestBody = '''
{
  "accountId": "${escapeStringForJson(clientId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Revoke Auth Stripe Connect',
      apiUrl:
          'https://us-central1-capideveloper-6078c.cloudfunctions.net/revokeStripeAccount',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${skToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? stripeUserID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.stripe_user_id''',
      ));
}

class StripeAccountsConnectCall {
  static Future<ApiCallResponse> call({
    String? skKey =
        'sk_test_51P5xUwDqyTvyz5vL5phy3XuCNLktgTDKAeZovZHH0dxv4M20VHSZJ9hodi6sOd6wnmIGx8eAQGYQqFCk9jwJ2tEF00ewIYvMxf',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Stripe Accounts Connect',
      apiUrl: 'https://api.stripe.com/v1/accounts',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${skKey}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? idAccountConnect(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].id''',
      ));
  static List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}

// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_animate/flutter_animate.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:core';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    Key? key,
    this.width,
    this.height,
    required this.metings,
    required this.peoplee,
    required this.rebuildpage,
    required this.actionAfterChange,
    required this.currentMeet,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<CitasRecord> metings;
  final List<UsersRecord> peoplee;
  final Future<dynamic> Function() rebuildpage;
  final Future<dynamic> Function() actionAfterChange;
  final CitasRecord currentMeet;

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late CalendarController _calendarController;
  late AppointmentDataSource _dataSource;
  CalendarView currentView = CalendarView.day; // Initial view

  @override
  void initState() {
    _calendarController = CalendarController();
    super.initState();
  }

  List<Appointment> getAppointments() {
    print(this.widget.metings);
    List<Appointment> meetings = <Appointment>[];

    for (int i = 0; i < this.widget.metings.length; i++) {
      final meeting = widget.metings[i];
      Color color = meeting.color!;
      DateTime start = meeting.fechaCIta!;
      DateTime end =
          meeting.fechaCIta!.add(Duration(minutes: meeting.duracion));
      for (int j = 0; j < widget.peoplee.length; j++) {
        if (widget.peoplee[j].uid == meeting.doctor!.id) {
          color = widget.peoplee[j].color ?? color;
        }
      }
      List<String>? resourceIds;
      final days = ['SU', 'MO', 'TU', 'WE', 'TH', 'FR', 'SA'];
      final dia = days[meeting.fechaCIta!.weekday];
      print(dia);
      if (meeting.doctor!.id.isEmpty) {
        resourceIds = ['0'];
      } else
        resourceIds = [meeting.doctor!.id];
      meetings.add(Appointment(
          startTime: start,
          endTime: end,
          id: meeting.uid,
          subject: meeting.resumen,
          color: color,
          //recurrenceRule: 'FREQ=WEEKLY;INTERVAL=1;BYDAY=$dia',
          recurrenceRule: null,
          resourceIds: resourceIds));
    }

    return meetings;
  }

  Widget build(BuildContext context) {
    _dataSource =
        AppointmentDataSource(getAppointments(), getResourcesWithEvents());

    if (FFAppState().showCalendar == true) {
      _showQuickViewNavigationDialog(context);
      FFAppState().update(() {
        FFAppState().showCalendar = false;
      });
    }
    ;

    if (FFAppState().prevDay == true) {
      _calendarController.backward!();
      FFAppState().update(() {
        FFAppState().currentDay = _calendarController.displayDate;
      });
      FFAppState().update(() {
        FFAppState().prevDay = false;
      });
    }
    ;

    if (FFAppState().nextDay == true) {
      _calendarController.forward!();
      FFAppState().update(() {
        FFAppState().currentDay = _calendarController.displayDate;
      });
      FFAppState().update(() {
        FFAppState().nextDay = false;
      });
    }
    ;

    if (FFAppState().today == true) {
      _calendarController.displayDate = FFAppState().currentDay;
      FFAppState().update(() {
        FFAppState().today = false;
      });
    }
    ;

    if (FFAppState().calendarView == "day") {
      currentView = CalendarView.day;
      _calendarController.view = currentView;
    }
    ;

    if (FFAppState().calendarView == "week") {
      currentView = CalendarView.week;
      _calendarController.view = currentView;
    }
    ;

    if (FFAppState().calendarView == "month") {
      currentView = CalendarView.month;
      _calendarController.view = currentView;
    }
    ;

    return Container(
        //child: SfCalendar(view: CalendarView.day),
        child: SfCalendar(
            controller: _calendarController,
            firstDayOfWeek: 1,
            dataSource: _dataSource,
            view: CalendarView.day,
            monthViewSettings: MonthViewSettings(showAgenda: true),
            onTap: (CalendarTapDetails details) async {
              if (details.targetElement == CalendarElement.appointment ||
                  details.targetElement == CalendarElement.agenda) {
                final Appointment appointment = details.appointments![0];
                FFAppState().currentMeeting.resumen = appointment.subject;
                FFAppState().currentMeeting.horaFin = appointment.endTime;
                FFAppState().currentMeeting.fechaCIta = appointment.startTime;
                FFAppState().currentMeeting.color = appointment.color;
                FFAppState().currentMeeting.uid = appointment.id! as String;
                FFAppState().currentMeeting.doctorID =
                    (appointment.resourceIds ?? [''])[0] as String;

                await widget.rebuildpage();
              }
            }));
  }

  void _showQuickViewNavigationDialog(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null && selectedDate != currentDate) {
      setState(() {
        _calendarController.displayDate = selectedDate;
      });
      FFAppState().update(() {
        FFAppState().currentDay = selectedDate;
      });
    }
  }

  List<CalendarResource> getResourcesWithEvents() {
    List<CalendarResource> resourcesWithEvents = <CalendarResource>[];

    for (int i = 0; i < widget.peoplee.length; i++) {
      final people = widget.peoplee[i];

      bool hasEvent = this
          .widget
          .metings
          .any((meeting) => meeting.doctor!.id == people.uid);

      ImageProvider<Object>? imageProvider =
          people.photoUrl.isNotEmpty ? NetworkImage(people.photoUrl) : null;

      if (hasEvent) {
        resourcesWithEvents.add(CalendarResource(
          displayName: people.displayName,
          id: people.uid,
          color: people.color!,
          image: imageProvider,
        ));
      }
    }

    return resourcesWithEvents;
  }
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(
      List<Appointment> source, List<CalendarResource> resourceColl) {
    appointments = source;
    resources = resourceColl;
  }
}

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:home_design/common/colors.dart';
import 'package:home_design/common/variables.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarHomePage extends StatefulWidget {
  const CalendarHomePage({super.key});

  @override
  State<CalendarHomePage> createState() => _CalendarHomePageState();
}

class _CalendarHomePageState extends State<CalendarHomePage> {
  //! -----------------------------------------------------------------
  late List<Meeting> meetings;
  DateTime? selectedDate;
  final CalendarController _monthCalendarController = CalendarController();
  final CalendarController _dayCalendarController = CalendarController();

  @override
  void initState() {
    super.initState();
    meetings = _getDataSource();
    selectedDate = DateTime.now();
  }

  void calendarTapped1(CalendarTapDetails details) {
    setState(() {
      selectedDate = details.date;
      if (selectedDate != null) {
        log("Selected Date: ${selectedDate.toString()}");
        _dayCalendarController.displayDate = selectedDate;
      }
    });
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    meetings.add(
        Meeting('Sports', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
  //! -----------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Todo: CalendarView.Month

        Expanded(
          flex: 2,
          child: SfCalendar(
            // todayTextStyle: TextStyle(
            //     color: CommonVariables.isDarkMode == false
            //         ? Colors.white
            //         : Colors.blue),
            // todayHighlightColor: CommonVariables.isDarkMode == false
            //     ? Colors.blue
            //     : Colors.white,
            // selectionDecoration:
            //     BoxDecoration(border: Border.all(color: Colors.blue)),

            controller: _monthCalendarController,
            view: CalendarView.month,
            dataSource: MeetingDataSource(meetings),
            showNavigationArrow: true,
            onTap: calendarTapped1,
            monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.indicator),
          ),
        ),

        const SizedBox(height: 30),

        // Todo: CalendarView.Day

        Expanded(
          flex: 2,
          child: SfCalendar(
            controller: _dayCalendarController,
            headerHeight: 0,
            view: CalendarView.day,
            dataSource: MeetingDataSource(meetings),
            monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode:
                    MonthAppointmentDisplayMode.appointment),
          ),
        ),
      ],
    );
  }
}

//! ---------------------- Class -----------------------------------

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

//! ---------------------- Model -----------------------------------

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
//! ------------------------------------------------------------------

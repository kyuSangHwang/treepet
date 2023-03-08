import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:treepet/const/color.dart';

class Calendar extends StatefulWidget {
  // DateTime? selectedDay;
  // DateTime focusedDay;
  // final OnDaySelected? onDaySelected;
  // String formattedDate;

  // Calendar({
  //   required this.selectedDay,
  //   required this.focusedDay,
  //   required this.onDaySelected,
  //   required this.formattedDate,
  //   Key? key,
  // }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime? selectedDay;
  DateTime focusDay = DateTime.now();
  OnDaySelected? onDaySelected;

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      color: Colors.grey[200],
    );
    final defaultTextStyle = TextStyle(
      color: Colors.grey[600],
      fontWeight: FontWeight.w700,
    );
    CalendarFormat format = CalendarFormat.month;

    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: focusDay,
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        defaultDecoration: defaultBoxDeco,
        weekendDecoration: defaultBoxDeco,
        selectedDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          border: Border.all(
            color: MAIN_COLOR,
            width: 1.0,
          ),
        ),
        outsideDecoration: const BoxDecoration(
          shape: BoxShape.rectangle,
        ),
        defaultTextStyle: defaultTextStyle,
        weekendTextStyle: defaultTextStyle,
        selectedTextStyle: defaultTextStyle.copyWith(
          color: MAIN_COLOR,
        ),
      ),
      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
        setState(() {
          print(selectedDay);
          this.selectedDay = selectedDay;
          this.focusDay = selectedDay;
        });
      },
      selectedDayPredicate: (DateTime date) {
        if (selectedDay == null) {
          return false;
        }

        return date.year == selectedDay!.year &&
            date.month == selectedDay!.month &&
            date.day == selectedDay!.day;
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:treepet/const/color.dart';
//
// class Calendar extends StatefulWidget {
//   final DateTime? selectedDay;
//   final DateTime focusedDay;
//   OnDaySelected? onDaySelected;
//
//   Calendar({
//     required this.selectedDay,
//     required this.focusedDay,
//     required this.onDaySelected,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<Calendar> createState() => _CalendarState();
// }
//
// class _CalendarState extends State<Calendar> {
//   @override
//   Widget build(BuildContext context) {
//     final defaultBoxDeco = BoxDecoration(
//       borderRadius: BorderRadius.circular(6.0),
//       color: Colors.grey[200],
//     );
//     final defaultTextStyle = TextStyle(
//       color: Colors.grey[600],
//       fontWeight: FontWeight.w700,
//     );
//     CalendarFormat format = CalendarFormat.month;
//
//     return TableCalendar(
//       locale: 'ko_KR',
//       focusedDay: widget.focusedDay,
//       firstDay: DateTime(1800),
//       lastDay: DateTime(3000),
//       headerStyle: const HeaderStyle(
//         formatButtonVisible: false,
//         titleCentered: true,
//         titleTextStyle: TextStyle(
//           fontWeight: FontWeight.w700,
//           fontSize: 16.0,
//         ),
//       ),
//       calendarStyle: CalendarStyle(
//         isTodayHighlighted: false,
//         defaultDecoration: defaultBoxDeco,
//         weekendDecoration: defaultBoxDeco,
//         selectedDecoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(6.0),
//           border: Border.all(
//             color: MAIN_COLOR,
//             width: 1.0,
//           ),
//         ),
//         outsideDecoration: const BoxDecoration(
//           shape: BoxShape.rectangle,
//         ),
//         defaultTextStyle: defaultTextStyle,
//         weekendTextStyle: defaultTextStyle,
//         selectedTextStyle: defaultTextStyle.copyWith(
//           color: MAIN_COLOR,
//         ),
//       ),
//       onDaySelected: widget.onDaySelected,
//
//       // onDaySelected: (DateTime onDaySelected, DateTime focusedDay) {
//       //   setState(() {
//       //     // widget.onDaySelected = onDaySelected;
//       //     selectedDays = selectedDays;
//       //   });
//       // },
//
//       selectedDayPredicate: (DateTime date) {
//         if (widget.selectedDay == null) {
//           return false;
//         }
//
//         return date.year == widget.selectedDay!.year &&
//             date.month == widget.selectedDay!.month &&
//             date.day == widget.selectedDay!.day;
//       },
//     );
//   }
// }

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class DateSelectorWidget extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChange;

  const DateSelectorWidget({
    super.key,
    required this.selectedDate,
    required this.onDateChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 4, right: 20, left: 20),
      decoration: BoxDecoration(
        color: const Color(0xff00A86B).withOpacity(0.48),
        borderRadius: BorderRadius.circular(24),
      ),
      child: DatePicker(
        DateTime.now().subtract(const Duration(days: 7)),
        height: 92,
        width: 50,
        initialSelectedDate: selectedDate,
        selectionColor: Colors.green,
        selectedTextColor: Colors.white,
        daysCount: 30,
        dayTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        inactiveDates: List.generate(
          7,
          (i) => DateTime.now().subtract(Duration(days: i + 1)),
        ),
        onDateChange: onDateChange,
      ),
    );
  }
}

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/features/ui/widget/task_item.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  DateTime selectedDate = DateTime.now(); // 👈 متغير التاريخ الحالي

  @override
  Widget build(BuildContext context) {
    final dayName = DateFormat('EEEE').format(selectedDate);
    final dayNumber = DateFormat('d').format(selectedDate);
    final monthName = DateFormat('MMMM').format(selectedDate);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: const Color(0xff00A86B),
              borderRadius: BorderRadius.circular(24),
            ),
            child: DatePicker(
              DateTime.now().subtract(const Duration(days: 7)),
              height: 96,
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
              onDateChange: (date) {
                setState(() {
                  selectedDate = date; // 👈 تحديث التاريخ المختار
                });
              },
            ),
          ),
          const Gap(12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  ' $dayNumber $monthName',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xff7E8491),
                  ),
                ),
                const Gap(20),
                Text(
                  dayName,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Color(0xff7E8491),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const TodayTaskList(),
        ],
      ),
    );
  }
}

class TodayTaskList extends StatelessWidget {
  const TodayTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return TodayItem();
      },
    );
  }
}

class TodayItem extends StatefulWidget {
  const TodayItem({super.key});

  @override
  State<TodayItem> createState() => _TodayItemState();
}

class _TodayItemState extends State<TodayItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TaskItem(
            onChanged: (value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
            isDone: isChecked,
            title: 'work',
            category: 'clean code',
            color: Colors.red,
          ),
          Divider(),
        ],
      ),
    );
  }
}

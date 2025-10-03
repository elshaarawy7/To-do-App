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
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dayName = DateFormat('EEEE').format(now); // اسم اليوم (مثال: Wednesday)
    final dayNumber = DateFormat('d').format(now); // رقم اليوم (2)
    final monthName = DateFormat('MMMM').format(now); // اسم الشهر (October)

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: Color(0xff00A86B), 
            borderRadius: BorderRadius.circular(50),
          ),
          child: DatePicker(
            DateTime.now().subtract(const Duration(days: 7)),
            height: 96,
            initialSelectedDate: DateTime.now(),
            selectedTextColor: Colors.white,
            daysCount: 15 , 
            dayTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            inactiveDates: List.generate(
              6,
              (i) => DateTime.now().subtract(Duration(days: i + 1)),
            ),
            onDateChange: (date) {
              debugPrint("Selected date: $date");
            },
          ),
        ),
        const Gap(12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                'Today, $dayNumber $monthName',
                style: const TextStyle(fontSize: 14, color: Color(0xff7E8491)),
              ),
              const Gap(20),
              Text(
                dayName, // 👈 اسم اليوم بيتغير تلقائي
                style: const TextStyle(fontSize: 14, color: Color(0xff7E8491)),
              ),
            ],
          ),
        ), 
        SizedBox(height: 10,) , 
         Divider() , 
         TodayTaskList(), 
         
      ],
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
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10), 
          child: TodayItem(),
        );
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
    return Column(
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
    );
  }
} 




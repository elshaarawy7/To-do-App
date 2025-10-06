import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  final List<String> tasks;
  const TaskPage({super.key, required this.tasks});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
<<<<<<< HEAD
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
=======
  late List<bool> completed;

  @override
  void initState() {
    super.initState();
    completed = List.generate(widget.tasks.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
     if (completed.length != widget.tasks.length) {
    completed = List.generate(widget.tasks.length, (index) {
      if (index < completed.length) {
        return completed[index]; // احتفظ بالحالة القديمة لو موجودة
      } else {
        return false; // التاسكات الجديدة تكون false
      }
    });
  } 

  
  if (widget.tasks.isEmpty) {
    return const Center(
      child: Text(
        "No tasks yet 😴",
        style: TextStyle(fontSize: 16, color: Colors.grey),
>>>>>>> 6f304a3404613adf86808e9bb02406954bd3c232
      ),
    );
  }

    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 75, 
          child: Card(
            
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: ListTile(
              leading: IconButton(
                icon: Icon(
                  completed[index]
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: completed[index] ? Colors.green : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    completed[index] = !completed[index];
                  });
                },
              ),
              title: Text(
                widget.tasks[index],
                style: TextStyle(
                  decoration: completed[index]
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      // هنا تقدر تضيف logic التعديل
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Edit task ${widget.tasks[index]}')),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        widget.tasks.removeAt(index);
                        completed.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

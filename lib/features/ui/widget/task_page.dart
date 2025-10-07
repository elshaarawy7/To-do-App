import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:gap/gap.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class TaskPage extends StatefulWidget {
  final List<String> tasks;
  const TaskPage({super.key, required this.tasks});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  DateTime selectedDate = DateTime.now();
  late List<bool> completed;

  @override
  void initState() {
    super.initState();
    completed = List.generate(widget.tasks.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    final dayName = DateFormat('EEEE').format(selectedDate);
    final dayNumber = DateFormat('d').format(selectedDate);
    final monthName = DateFormat('MMMM').format(selectedDate);

    // تحديث القائمة لو اتغيرت عدد التاسكات
    if (completed.length != widget.tasks.length) {
      completed = List.generate(widget.tasks.length, (index) {
        if (index < completed.length) {
          return completed[index];
        } else {
          return false;
        }
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // 🔹 التاريخ و DatePicker
          Container(
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
              onDateChange: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
          ),

          const Gap(12),

          // 🔹 اسم اليوم والتاريخ
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

          // 🔹 قائمة التاسكات
          if (widget.tasks.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "No tasks yet 😴",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.tasks.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 75,
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 10,
                    ),
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Edit task ${widget.tasks[index]}',
                                  ),
                                ),
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
            ),
        ],
      ),
    );
  }
}

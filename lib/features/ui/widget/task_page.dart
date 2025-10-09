import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/features/ui/widget/date_selector_widget.dart';

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

    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        // 🔹 التاريخ و DatePicker
        DateSelectorWidget(
          selectedDate: selectedDate,
          onDateChange: (date) {
            setState(() {
              selectedDate = date;
            });
          },
        ),

        const Gap(12),

        // 🔹 اسم اليوم والتاريخ
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                ' $dayNumber $monthName',
                style: const TextStyle(fontSize: 10, color: Color(0xff7E8491)),
              ),
              const Gap(20),
              Text(
                dayName,
                style: const TextStyle(fontSize: 10, color: Color(0xff7E8491)),
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
                            TextEditingController controller =
                                TextEditingController(
                                  text: widget.tasks[index],
                                );

                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  title: const Text(
                                    "Edit Task",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: TextField(
                                    controller: controller,
                                    decoration: const InputDecoration(
                                      hintText: "Enter new task name",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context); // يقفل الديالوج
                                      },
                                      child:  Text("Cancel" , style: TextStyle(
                                        color: Colors.black , 
                                      ),),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          widget.tasks[index] = controller.text;
                                        });
                                        Navigator.pop(
                                          context,
                                        ); // يقفل بعد الحفظ
                                      },
                                      child: const Text("Save"),
                                    ),
                                  ],
                                );
                              },
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
    );
  }
}

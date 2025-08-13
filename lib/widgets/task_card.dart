import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo25/models/task_model.dart';
import 'package:todo25/providers/dark_mode_provider.dart';
import 'package:todo25/widgets/delete_dialog.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel, required this.onSwitch});
  final TaskModel taskModel;
  final Function onSwitch;
  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeProvider>(
      builder: (context, mode, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 40,
            decoration: BoxDecoration(
              color: taskModel.isCompleted
                  ? Colors.black12
                  : Colors.white.withValues(alpha: mode.isDark ? 0.1 : 1),

              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        taskModel.title,
                        style: TextStyle(
                          color: mode.isDark ? Colors.white : Colors.black,
                          fontSize: 22,
                          decorationColor: mode.isDark
                              ? Colors.white
                              : Colors.black,
                          decoration: taskModel.isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),

                      Checkbox(
                        fillColor: WidgetStatePropertyAll(
                          mode.isDark ? Colors.white : null,
                        ),
                        checkColor: mode.isDark ? Colors.blue : null,

                        value: taskModel.isCompleted,
                        onChanged: (v) {
                          onSwitch();
                        },
                      ),
                    ],
                  ),

                  Text(
                    taskModel.subtitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      decoration: taskModel.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: mode.isDark
                          ? Colors.white
                          : Colors.black,

                      color: mode.isDark ? Colors.white : Colors.black,
                    ),
                  ),

                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${taskModel.createdAt.substring(0, 10).replaceAll("-", "/")}  ${taskModel.createdAt.substring(11, 16)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: mode.isDark ? Colors.white : Colors.black,
                          decorationColor: mode.isDark
                              ? Colors.white
                              : Colors.black,
                          fontSize: 16,
                          decoration: taskModel.isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (contex) =>
                                DeleteDialog(taskModel: taskModel),
                          );
                        },
                        icon: Icon(
                          Icons.delete,
                          color: mode.isDark ? Colors.white : null,
                        ),
                      ),
                    ],
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

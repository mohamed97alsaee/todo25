import 'package:flutter/material.dart';
import 'package:todo25/models/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel, required this.onSwitch});
  final TaskModel taskModel;
  final Function onSwitch;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 40,
        decoration: BoxDecoration(
          color: taskModel.isCompleted ? Colors.black12 : Colors.white,

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
                      fontSize: 22,
                      decoration: taskModel.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),

                  Checkbox(
                    value: taskModel.isCompleted,
                    onChanged: (v) {
                      onSwitch();
                    },
                  ),
                ],
              ),

              Text(
                taskModel.subTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  decoration: taskModel.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),

              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    taskModel.createdAt
                        .toIso8601String()
                        .substring(0, 10)
                        .replaceAll("-", "/"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: taskModel.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),

                  Text(
                    taskModel.createdAt.toIso8601String().substring(11, 16),

                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: taskModel.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

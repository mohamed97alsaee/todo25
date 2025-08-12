import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo25/models/task_model.dart';
import 'package:todo25/providers/tasks_provider.dart';

class DeleteDialog extends StatefulWidget {
  const DeleteDialog({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  State<DeleteDialog> createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete Task"),
      content: Text(
        "Are you sure you want to delete the task ${widget.taskModel.title}?",
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Provider.of<TasksProvider>(
              context,
              listen: false,
            ).deleteTask(widget.taskModel);
            Navigator.pop(context);
          },
          child: Text("DELETE"),
        ),

        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
      ],
    );
  }
}

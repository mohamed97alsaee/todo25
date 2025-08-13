import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo25/models/task_model.dart';
import 'package:todo25/providers/tasks_provider.dart';

class AddNewTaskDialog extends StatefulWidget {
  const AddNewTaskDialog({super.key});

  @override
  State<AddNewTaskDialog> createState() => _AddNewTaskDialogState();
}

class _AddNewTaskDialogState extends State<AddNewTaskDialog> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "ADD NEW TASK",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(hintText: "Title"),
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Title Required!";
                  }
                  if (v.length < 2) {
                    return "Title must be more than 1 char";
                  }

                  //   if (v[0] != "0") {
                  //   return "Title must be more than 1 char";
                  // }

                  return null;
                },
              ),
              SizedBox(height: 12),

              TextFormField(
                controller: subTitleController,
                decoration: InputDecoration(hintText: "SubTitle"),
                validator: (v) {
                  if (v!.isEmpty) {
                    return "SubTitle Required!";
                  }
                  if (v.length < 2) {
                    return "SubTitle must be more than 1 char";
                  }

                  //   if (v[0] != "0") {
                  //   return "SubTitle must be more than 1 char";
                  // }

                  return null;
                },
              ),

              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Provider.of<TasksProvider>(
                          context,
                          listen: false,
                        ).addNewTask(
                          TaskModel(
                            title: titleController.text,
                            subtitle: subTitleController.text,
                            createdAt: DateTime.now().toIso8601String(),
                            isCompleted: false,
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        print("USER NOT TAMAM");
                      }
                    },
                    child: Text("Add"),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
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

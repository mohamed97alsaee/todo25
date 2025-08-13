import 'package:flutter/widgets.dart';
import 'package:todo25/models/task_model.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> tasks = [
    TaskModel(
      title: "T1",
      subtitle: "ST1",
      createdAt: DateTime.now().toIso8601String(),
      isCompleted: false,
    ),
    TaskModel(
      title: "T2",
      subtitle: "ST1",
      createdAt: DateTime.now().toIso8601String(),
      isCompleted: false,
    ),
  ];

  addNewTask(TaskModel tm) {
    tasks.add(tm);
    notifyListeners();
  }

  deleteTask(TaskModel tm) {
    tasks.remove(tm);
    notifyListeners();
  }

  switchTaskStatus(TaskModel tm) {
    tasks[tasks.indexOf(tm)].isCompleted =
        !tasks[tasks.indexOf(tm)].isCompleted;
    notifyListeners();
  }
}

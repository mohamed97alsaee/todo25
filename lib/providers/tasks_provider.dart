import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo25/models/task_model.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> tasks = [];

  addNewTask(TaskModel tm) {
    tasks.add(tm);
    
    saveToLocalStorage();

    notifyListeners();
  }

  deleteTask(TaskModel tm) {
    tasks.remove(tm);
    saveToLocalStorage();

    notifyListeners();
  }

  switchTaskStatus(TaskModel tm) {
    tasks[tasks.indexOf(tm)].isCompleted =
        !tasks[tasks.indexOf(tm)].isCompleted;
    saveToLocalStorage();
    notifyListeners();
  }


  saveToLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var jsonData = tasks.map((i) => i.toJson()).toList();

    var encodedData = jsonEncode(jsonData);

    prefs.setString("tasks_data", encodedData);

    getFromLocalStorage();
  }





  getFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? data = prefs.getString("tasks_data");

    if (data != null) {
      var decodedData = jsonDecode(data);

      tasks = List<TaskModel>.from(
        decodedData.map((e) => TaskModel.fromJson(e)),
      );
    }
    notifyListeners();
  }
}

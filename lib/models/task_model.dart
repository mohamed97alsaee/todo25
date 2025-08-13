// class TaskModel {
//   String title;
//   String subTitle;
//   bool isCompleted;
//   DateTime createdAt;

//   TaskModel({
//     required this.title,
//     required this.subTitle,
//     this.isCompleted = false,
//     required this.createdAt,
//   });
// }

import 'dart:convert';

class TaskModel {
  String title;
  String subtitle;
  String createdAt;
  bool isCompleted;

  TaskModel({
    required this.title,
    required this.subtitle,
    required this.createdAt,
    required this.isCompleted,
  });

  factory TaskModel.fromRawJson(String str) =>
      TaskModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    title: json["title"],
    subtitle: json["subtitle"],
    createdAt: json["created_at"],
    isCompleted: json["is_completed"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "created_at": createdAt,
    "is_completed": isCompleted,
  };
}

var tm = TaskModel(
  title: "title",
  subtitle: "subtitle",
  createdAt: "createdAt",
  isCompleted: false,
).toJson();

var jsonData = {
  "title": "task1",
  "sub_title": "ABDC",
  "created_at": "2025-08-13T10:00",
  "is_completed": true,
};

TaskModel task = TaskModel.fromJson(jsonData);

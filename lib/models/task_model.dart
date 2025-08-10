class TaskModel {
  String title;
  String subTitle;
  bool isCompleted;
  DateTime createdAt;

  TaskModel({
    required this.title,
    required this.subTitle,
    this.isCompleted = false,
    required this.createdAt,
  });
}

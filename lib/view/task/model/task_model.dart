class Task {
  String taskID;
  String userID;
  String title;
  String description;
  String category;
  DateTime dueDate;
  bool isCompleted;

  Task({
    required this.taskID,
    required this.userID,
    required this.title,
    required this.description,
    required this.category,
    required this.dueDate,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'taskID': taskID,
      'userID': userID,
      'title': title,
      'description': description,
      'category': category,
      'dueDate': dueDate.toIso8601String(),
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      taskID: json['taskID'],
      userID: json['userID'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      dueDate: DateTime.parse(json['dueDate']),
      isCompleted: json['isCompleted'] == 1,
    );
  }
}

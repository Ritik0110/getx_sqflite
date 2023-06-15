class TodoModel {
  final int id;
  final String title;
  final String description;
  final int isDone;

  TodoModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.isDone});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        isDone: json["isDone"]);
  }
}

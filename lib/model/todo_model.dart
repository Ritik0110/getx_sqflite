class TodoModel {
  final int id;
  final String name;
  final String emailId;
  final int age;

  TodoModel(
      {required this.id,
      required this.name,
      required this.emailId,
      required this.age});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json["id"],
        name: json["name"],
        emailId: json["emailId"],
        age: json["age"]);
  }
}

import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  String title;
  String category;
  DateTime start;
  DateTime end;

  Task({
    required this.title,
    required this.category,
    required this.start,
    required this.end,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    title: json["title"],
    category: json["category"],
    start: json["start"],
    end: json["end"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "category": category,
    "start": start,
    "end": end,
  };
}

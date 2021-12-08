// { "userId": 1,
//   "id": 1,
//   "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//   "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
// },

class Posts {
  int userId;
  int id;
  String title;
  String body;

//// constructor with named arguments
  Posts(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  ///  contructuor with un named arguments
  // Posts(required this.userId, required this.id, required this.title, required this.body);

  factory Posts.fromJson(Map json) {
    return Posts(
      userId: json["userId"] ?? -1,
      id: json['id'] ?? -1,
      title: json['title'] ?? "",
      body: json['body'] ?? "",
    );
  }

  Map toJson() {
    return {"userId": userId, "id": id, "title": title, "body": body};
  }
}

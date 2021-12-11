class NewPosts {
  int newUserId;
  String newImageUrl;

  NewPosts({required this.newUserId, required this.newImageUrl});

  factory NewPosts.fromJson(Map json) {
    return NewPosts(
      newUserId: json["newUserId"] ?? -1,
      newImageUrl: json["newImageUrl"] ?? "",
    );
  }
  Map toJson() {
    return {
      "newUserId": newUserId,
      "newImageUrl": newImageUrl,
    };
  }
}

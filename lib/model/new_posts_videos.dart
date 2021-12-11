class NewVideos {
  int id;
  String videoUrl;

  NewVideos({
    required this.id,
    required this.videoUrl,
  });

  factory NewVideos.fromJson(Map json) {
    return NewVideos(
      id: json["id"] ?? -1,
      videoUrl: json["videos"]["large"]["url"] ?? "",
    );
  }
  Map toJson() {
    return {
      "id": id,
      "videoUrl": videoUrl,
    };
  }
}

class Bookmark {
  String? url;
  String? title;

  Bookmark({
    required this.url,
    required this.title,
  });

  Map<String, dynamic> toJson() => {
        'url': url,
        'title': title,
      };

  Bookmark.fromMap(Map map)
      : url = map["url"],
        title = map["title"];

  Map toMap() {
    return {
      "url": url,
      "title": title,
    };
  }
}

class NewsList {
  final String desc;
  final String id;
  final String createdAt;
  final String publishedAt;
  final String source;
  final String type;
  final String url;

  NewsList({
      this.id,
      this.desc,
      this.createdAt,
      this.publishedAt,
      this.source,
      this.type,
      this.url,}
      );

  factory NewsList.fromJson(Map<String, dynamic> data) {
    return  NewsList(
        id:data['_id'],
        desc:data['desc'],
        createdAt:data['createdAt'],
        publishedAt:data['publishedAt'],
        source:data['source'],
        type:data['type'],
        url:data['url']
    );
  }
}
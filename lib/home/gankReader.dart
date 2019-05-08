class GankReader {
  final String title;
  final String id;
  final String createdAt;
  final String publishedAt;
  final String cover;
  final String url;
  final String content;

  GankReader({
    this.id,
    this.title,
    this.createdAt,
    this.publishedAt,
    this.cover,
    this.url,
    this.content}
      );

  factory GankReader.fromJson(Map<String, dynamic> data) {
    return  GankReader(
        id:data['_id'],
        title:data['title'],
        createdAt:data['created_at'],
        publishedAt:data['published_at'],
        cover:data['cover'],
        url:data['url'],
        content:data['content']
    );
  }
}
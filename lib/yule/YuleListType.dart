class YuleListType {
  final String category;
  final String url;
  final String date;
  final String title;
  final String thumbnail_pic_s;
  final String thumbnail_pic_s02;
  final String author_name;

  YuleListType({
    this.url,
    this.category,
    this.date,
    this.title,
    this.thumbnail_pic_s,
    this.thumbnail_pic_s02,
    this.author_name,}
      );

  factory YuleListType.fromJson(Map<String, dynamic> data) {
    return  YuleListType(
        url:data['url'],
        category:data['category'],
        date:data['date'],
        title:data['title'],
        thumbnail_pic_s:data['thumbnail_pic_s'],
        thumbnail_pic_s02:data['thumbnail_pic_s02'],
        author_name:data['author_name']
    );
  }
}
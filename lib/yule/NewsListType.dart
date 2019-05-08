class NewsListType {
  final String keywords;
  final String add_time;
  final String summary;
  final String text;
  final String source_name;
  final String pic;

  NewsListType({
    this.keywords,
    this.add_time,
    this.summary,
    this.text,
    this.source_name,
    this.pic,}
      );

  factory NewsListType.fromJson(Map<String, dynamic> data) {
    return  NewsListType(
        keywords:data['keywords'],
        add_time:data['add_time'],
        summary:data['summary'],
        text:data['text'],
        source_name:data['source_name'],
        pic:data['pic']
    );
  }
}
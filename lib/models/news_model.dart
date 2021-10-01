class NewsModel {
  //Map? source;
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModel({
    //this.source,
    this.author,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    //source = json['source'];
    author = json['author'];
    title = json['title'];
    description = json['description'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    return {
      //'source': source,
      'author': author,
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}

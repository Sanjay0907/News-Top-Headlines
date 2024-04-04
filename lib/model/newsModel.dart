// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewsModel {
  String? author;
  String? title;
  String? description;
  String? newsImageURL;
  String? publishDate;
  String? content;
  NewsModel({
    this.author,
    this.title,
    this.description,
    this.newsImageURL,
    this.publishDate,
    this.content,
  });

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
        author: map['author'] != null ? map['author'] as String : null,
        title: map['title'] != null ? map['title'] as String : null,
        description:
            map['description'] != null ? map['description'] as String : null,
        newsImageURL:
            map['urlToImage'] != null ? map['urlToImage'] as String : null,
        publishDate: map['publishedAt'] as String,
        content: map['content'] != null ? map['content'] as String : null);
  }

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

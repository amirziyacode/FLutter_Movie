// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class Movie {
  String title;
  String posterPath;
  // ignore: prefer_typing_uninitialized_variables
  var vote_average;
  String original_language;
  String overview;
  int vote_count;
  Movie(
      {required this.title,
      required this.posterPath,
      required this.vote_average,
      required this.original_language,
      required this.overview,
      required this.vote_count});

  String get fullImageUrl => "https://image.tmdb.org/t/p/w500/$posterPath";

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'posterPath': posterPath,
      'vote_average': vote_average,
      'vote_count': vote_count,
      "overview" : overview,
      "original_language": original_language
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] as String,
      posterPath: map['poster_path'] as String,
      vote_average: map['vote_average'] as dynamic,
      vote_count: map['vote_count'] as int,
      overview : map['overview'] as String,
      original_language: map['original_language'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) =>
      Movie.fromMap(json.decode(source) as Map<String, dynamic>);
}

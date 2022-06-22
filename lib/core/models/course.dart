import 'dart:convert';

import 'package:lectarium/core/models/user.dart';

class Course {
  dynamic kartinka_kursa = '';
  dynamic course_progress = '';
  int id = 0;
  int? current_last_openned_index = 0;
  dynamic product_cat = '';
  dynamic month = '';
  String author_url = '';
  User? author;
  String kategoriya_kursa = '';
  bool isFavorite = false;
  String title = '';

  Course({
    required this.kartinka_kursa,
    required this.course_progress,
    required this.id,
    required this.product_cat,
    required this.month,
    required this.author_url,
    this.author,
    required this.kategoriya_kursa,
    required this.isFavorite,
    required this.title,
    this.current_last_openned_index,
  });

  Course copyWith({
    dynamic? kartinka_kursa,
    dynamic? course_progress,
    int? id,
    dynamic? product_cat,
    dynamic? month,
    String? author_url,
    User? author,
    String? kategoriya_kursa,
    bool? isFavorite,
    String? title,
    int? current_last_openned_index,
  }) {
    return Course(
        kartinka_kursa: kartinka_kursa ?? this.kartinka_kursa,
        course_progress: course_progress ?? this.course_progress,
        id: id ?? this.id,
        product_cat: product_cat ?? this.product_cat,
        month: month ?? this.month,
        author_url: author_url ?? this.author_url,
        author: author ?? this.author,
        kategoriya_kursa: kategoriya_kursa ?? this.kategoriya_kursa,
        isFavorite: isFavorite ?? this.isFavorite,
        title: title ?? this.title,
        current_last_openned_index:
            current_last_openned_index ?? this.current_last_openned_index);
  }

  Map<String, dynamic> toMap() {
    return {
      'kartinka_kursa': kartinka_kursa,
      'course_progress': course_progress,
      'id': id,
      'product_cat': product_cat,
      'month': month,
      'author_url': author_url,
      'author': author?.toJson(),
      'kategoriya_kursa': kategoriya_kursa,
      'isFavorite': isFavorite,
      'title': title,
      'current_last_openned_index': current_last_openned_index,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
        kartinka_kursa: map['kartinka_kursa'],
        course_progress: map['course_progress'],
        id: map['id'],
        product_cat: map['product_cat'],
        month: map['month'],
        author_url: map['author_url'],
        author: User.fromJson(map['author']),
        kategoriya_kursa: map['kategoriya_kursa'],
        isFavorite: map['isFavorite'],
        title: map['title'],
        current_last_openned_index: map['current_last_openned_index']);
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Course(kartinka_kursa: $kartinka_kursa, course_progress: $course_progress, id: $id, product_cat: $product_cat, month: $month, author_url: $author_url, author: $author, kategoriya_kursa: $kategoriya_kursa, isFavorite: $isFavorite, title: $title, current_last_openned_index: $current_last_openned_index)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Course &&
        other.kartinka_kursa == kartinka_kursa &&
        other.course_progress == course_progress &&
        other.id == id &&
        other.product_cat == product_cat &&
        other.month == month &&
        other.author_url == author_url &&
        other.author == author &&
        other.kategoriya_kursa == kategoriya_kursa &&
        other.isFavorite == isFavorite &&
        other.title == title &&
        other.current_last_openned_index == current_last_openned_index;
  }

  @override
  int get hashCode {
    return kartinka_kursa.hashCode ^
        course_progress.hashCode ^
        id.hashCode ^
        product_cat.hashCode ^
        month.hashCode ^
        author_url.hashCode ^
        author.hashCode ^
        kategoriya_kursa.hashCode ^
        title.hashCode ^
        current_last_openned_index.hashCode ^
        isFavorite.hashCode;
  }
}

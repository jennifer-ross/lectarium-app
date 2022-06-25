// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:lectarium/core/models/course_progress.dart';
import 'package:lectarium/core/models/post.dart';
import 'package:lectarium/core/models/term.dart';

class Course extends Post {
  bool? isFavorite = false;
  String? imageUrl = '';
  CourseProgress? progress;
  List<Term>? productCat = <Term>[];
  List<Term>? month = <Term>[];
  String? category = '';
  int? lastOpenedIndex = 0;

  Course._();

  Course.withPost(
    Post post, {
    this.productCat,
    this.category,
    this.imageUrl,
    this.lastOpenedIndex = 0,
    this.month,
    this.progress,
    this.isFavorite,
  }) : super.withObject(post);

  Course({
    this.productCat,
    this.category,
    this.imageUrl,
    this.lastOpenedIndex = 0,
    this.month,
    this.progress,
    this.isFavorite,
    int? id,
    int? postAuthor,
    String? postDate,
    String? postDateGtm,
    String? postContent,
    String? postExcerpt,
    String? postStatus,
    String? commentStatus,
    String? postPassword,
    String? postName,
    String? toPing,
    String? pinned,
    String? postModified,
    String? postModifiedGtm,
    String? postContentFiltered,
    int? postParent,
    String? guid,
    int? menuOrder,
    String? postType,
    String? postMimeType,
    int? commentCount,
    String? filter,
    String? postTitle,
  }) : super(
          id: id,
          postAuthor: postAuthor,
          postDate: postDate,
          postDateGtm: postDateGtm,
          postContent: postContent,
          postExcerpt: postExcerpt,
          postStatus: postStatus,
          commentStatus: commentStatus,
          postPassword: postPassword,
          postName: postName,
          toPing: toPing,
          pinned: pinned,
          postModified: postModified,
          postModifiedGtm: postModifiedGtm,
          postContentFiltered: postContentFiltered,
          postParent: postParent,
          guid: guid,
          menuOrder: menuOrder,
          postType: postType,
          postMimeType: postMimeType,
          commentCount: commentCount,
          filter: filter,
          postTitle: postTitle,
        );

  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'is_favorite': isFavorite,
      'course_image_url': imageUrl,
      'category': category,
      'last_opened_index': lastOpenedIndex,
      'course_progress':
          progress != null ? progress?.toMap() : CourseProgress(),
      'product_cat': productCat?.asMap(),
      'month': month?.asMap(),
    };

    map.addAll(super.toMap());

    return map;
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    final post = Post.fromMap(map);
    List<dynamic> cats = map['product_cat'] as List<dynamic>;
    List<dynamic> months = map['month'] as List<dynamic>;
    List<Term> buildedCats = <Term>[];
    List<Term> buildedMonths = <Term>[];

    if (cats.isNotEmpty) {
      for (dynamic element in cats) {
        buildedCats.add(Term.fromMap(element));
      }
    }

    if (months.isNotEmpty) {
      for (Map<String, dynamic> element in months) {
        buildedMonths.add(Term.fromMap(element));
      }
    }

    return Course.withPost(
      post,
      isFavorite: map['is_favorite'] as bool,
      imageUrl: map['course_image_url'] as String,
      category: map['category'] as String,
      lastOpenedIndex: map['last_opened_index'] != null
          ? map['last_opened_index'] as int
          : 0,
      progress: map['course_progress'] != null
          ? CourseProgress.fromMap(
              map['course_progress'] as Map<String, dynamic>)
          : CourseProgress(),
      productCat: map['product_cat'] != null ? buildedCats : <Term>[],
      month: map['month'] != null ? buildedMonths : <Term>[],
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Course &&
        other.id == id &&
        other.postAuthor == postAuthor &&
        other.postDate == postDate &&
        other.postDateGtm == postDateGtm &&
        other.postContent == postContent &&
        other.postTitle == postTitle &&
        other.postExcerpt == postExcerpt &&
        other.postStatus == postStatus &&
        other.commentStatus == commentStatus &&
        other.postPassword == postPassword &&
        other.postName == postName &&
        other.toPing == toPing &&
        other.pinned == pinned &&
        other.postModified == postModified &&
        other.postModifiedGtm == postModifiedGtm &&
        other.postContentFiltered == postContentFiltered &&
        other.postParent == postParent &&
        other.guid == guid &&
        other.menuOrder == menuOrder &&
        other.postType == postType &&
        other.postMimeType == postMimeType &&
        other.commentCount == commentCount &&
        other.imageUrl == imageUrl &&
        other.category == category &&
        other.lastOpenedIndex == lastOpenedIndex &&
        other.progress == progress &&
        listEquals(other.month, month) &&
        listEquals(other.productCat, productCat) &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return super.hashCode ^
        imageUrl.hashCode ^
        category.hashCode ^
        lastOpenedIndex.hashCode ^
        progress.hashCode ^
        month.hashCode ^
        productCat.hashCode ^
        isFavorite.hashCode;
  }

  @override
  String toString() {
    return 'Course(isFavorite: $isFavorite, imageUrl: $imageUrl, productCat: $productCat, month: $month, category: $category, lastOpenedIndex: $lastOpenedIndex) extends ' +
        super.toString();
  }
}

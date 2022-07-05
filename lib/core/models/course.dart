// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:lectarium/core/models/course_progress.dart';
import 'package:lectarium/core/models/post.dart';
import 'package:lectarium/core/models/term.dart';
import 'package:lectarium/core/models/user.dart';
import 'package:lectarium/core/models/user_data.dart';

class Course extends Post {
  bool isFavorite = false;
  String imageUrl = '';
  CourseProgress progress = CourseProgress();
  List<Term> productCat = <Term>[];
  List<Term> month = <Term>[];
  String category = '';
  int lastOpenedIndex = 0;

  Course._() : super(author: User(data: UserData()));

  Course.withPost(
    Post post, {
    this.productCat = const <Term>[],
    this.category = '',
    this.imageUrl = '',
    this.lastOpenedIndex = 0,
    this.month = const <Term>[],
    required this.progress,
    this.isFavorite = false,
  }) : super.withObject(post);

  Course({
    this.productCat = const <Term>[],
    this.category = '',
    this.imageUrl = '',
    this.lastOpenedIndex = 0,
    this.month = const <Term>[],
    required this.progress,
    this.isFavorite = false,
    int id = 0,
    int postAuthor = 0,
    String postDate = '0000-00-00 00:00:00',
    String postDateGtm = '0000-00-00 00:00:00',
    String postContent = '',
    String postExcerpt = '',
    String postStatus = 'publish',
    String commentStatus = 'open',
    String postPassword = '',
    String postName = '',
    String toPing = '',
    String pinned = '',
    String postModified = '0000-00-00 00:00:00',
    String postModifiedGtm = '0000-00-00 00:00:00',
    String postContentFiltered = '',
    int postParent = 0,
    String guid = '',
    int menuOrder = 0,
    String postType = 'post',
    String postMimeType = '',
    int commentCount = 0,
    String filter = 'raw',
    String postTitle = '',
    User? author,
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
            author: author ?? User(data: UserData()));

  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'is_favorite': isFavorite,
      'course_image_url': imageUrl,
      'category': category,
      'last_opened_index': lastOpenedIndex,
      'course_progress': progress.toMap(),
      'product_cat': productCat.asMap(),
      'month': month.asMap(),
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
      productCat: map['product_cat'] != null ? buildedCats : const <Term>[],
      month: map['month'] != null ? buildedMonths : const <Term>[],
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) =>
      Course.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      postAuthor,
      author,
      postDate,
      postDateGtm,
      postContent,
      postTitle,
      postExcerpt,
      postStatus,
      commentStatus,
      postPassword,
      postName,
      toPing,
      pinned,
      postModified,
      postModifiedGtm,
      postContentFiltered,
      postParent,
      guid,
      menuOrder,
      postType,
      postMimeType,
      commentCount,
      filter,
      isFavorite,
      imageUrl,
      category,
      lastOpenedIndex,
      progress,
      productCat,
      month,
    ];
  }
}

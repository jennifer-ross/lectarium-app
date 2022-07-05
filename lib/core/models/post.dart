// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:lectarium/core/base/base_model.dart';
import 'package:lectarium/core/models/user_data.dart';

import 'user.dart';

class Post extends BaseModel {
  int id = 0;
  int postAuthor = 0;
  User author = User(data: UserData());
  String postDate = '0000-00-00 00:00:00';
  String postDateGtm = '0000-00-00 00:00:00';
  String postContent = '';
  String postTitle = '';
  String postExcerpt = '';
  String postStatus = 'publish';
  String commentStatus = 'open';
  String postPassword = '';
  String postName = '';
  String toPing = '';
  String pinned = '';
  String postModified = '0000-00-00 00:00:00';
  String postModifiedGtm = '0000-00-00 00:00:00';
  String postContentFiltered = '';
  int postParent = 0;
  String guid = '';
  int menuOrder = 0;
  String postType = 'post';
  String postMimeType = '';
  int commentCount = 0;
  String filter = 'raw';

  Post._();

  Post.withObject(Post post) {
    id = post.id;
    postAuthor = post.postAuthor;
    postDateGtm = post.postDateGtm;
    postContent = post.postContent;
    postExcerpt = post.postExcerpt;
    postStatus = post.postStatus;
    commentStatus = post.commentStatus;
    postPassword = post.postPassword;
    postName = post.postName;
    toPing = post.toPing;
    pinned = post.pinned;
    postModified = post.postModified;
    postModifiedGtm = post.postModifiedGtm;
    postContentFiltered = post.postContentFiltered;
    postParent = post.postParent;
    guid = post.guid;
    menuOrder = post.menuOrder;
    postType = post.postType;
    postMimeType = post.postMimeType;
    commentCount = post.commentCount;
    filter = post.filter;
    postTitle = post.postTitle;
    author = post.author;
  }

  Post(
      {this.id = 0,
      this.postAuthor = 0,
      this.postDate = '0000-00-00 00:00:00',
      this.postDateGtm = '0000-00-00 00:00:00',
      this.postContent = '',
      this.postExcerpt = '',
      this.postStatus = 'publish',
      this.commentStatus = 'open',
      this.postPassword = '',
      this.postName = '',
      this.toPing = '',
      this.pinned = '',
      this.postModified = '0000-00-00 00:00:00',
      this.postModifiedGtm = '0000-00-00 00:00:00',
      this.postContentFiltered = '',
      this.postParent = 0,
      this.guid = '',
      this.menuOrder = 0,
      this.postType = 'post',
      this.postMimeType = '',
      this.commentCount = 0,
      this.filter = 'raw',
      this.postTitle = '',
      required this.author});

  Post copyWith({
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
  }) {
    return Post(
      id: id,
      postAuthor: postAuthor,
      postDate: postDate,
      postDateGtm: postDateGtm,
      postContent: postContent,
      postTitle: postTitle,
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
      author: author ?? User(data: UserData()),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'post_author': postAuthor,
      'post_date': postDate,
      'post_date_gtm': postDateGtm,
      'post_content': postContent,
      'post_title': postTitle,
      'post_excerpt': postExcerpt,
      'post_status': postStatus,
      'comment_status': commentStatus,
      'post_password': postPassword,
      'post_mame': postName,
      'to_ping': toPing,
      'pinned': pinned,
      'post_modified': postModified,
      'post_modified_gtm': postModifiedGtm,
      'post_content_filtered': postContentFiltered,
      'post_parent': postParent,
      'guid': guid,
      'menu_order': menuOrder,
      'post_type': postType,
      'post_mime_type': postMimeType,
      'comment_count': commentCount,
      'filter': filter,
      'author': author.toMap(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['ID'] as int,
      postAuthor: map['post_author'] as int,
      postDate: map['post_date'] as String,
      postDateGtm: map['post_date_gtm'] as String,
      postContent: map['post_content'] as String,
      postTitle: map['post_title'] as String,
      postExcerpt: map['post_excerpt'] as String,
      postStatus: map['post_status'] as String,
      commentStatus: map['comment_status'] as String,
      postPassword: map['post_password'] as String,
      postName: map['post_name'] as String,
      toPing: map['to_ping'] as String,
      pinned: map['pinned'] as String,
      postModified: map['post_modified'] as String,
      postModifiedGtm: map['post_modified_gtm'] as String,
      postContentFiltered: map['post_content_filtered'] as String,
      postParent: map['post_parent'] as int,
      guid: map['guid'] as String,
      menuOrder: map['menu_order'] as int,
      postType: map['post_type'] as String,
      postMimeType: map['post_mime_type'] as String,
      commentCount: map['comment_count'] as int,
      filter: map['filter'] as String,
      author: map['author'] != null
          ? User.fromMap(map['author'] as Map<String, dynamic>)
          : User(data: UserData()),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

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
    ];
  }
}

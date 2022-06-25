// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'user.dart';

class Post {
  int? id = 0;
  int? postAuthor = 0;
  User? author;
  // TODO: Add author
  String? postDate = '0000-00-00 00:00:00';
  String? postDateGtm = '0000-00-00 00:00:00';
  String? postContent = '';
  String? postTitle = '';
  String? postExcerpt = '';
  String? postStatus = 'publish';
  String? commentStatus = 'open';
  String? postPassword = '';
  String? postName = '';
  String? toPing = '';
  String? pinned = '';
  String? postModified = '0000-00-00 00:00:00';
  String? postModifiedGtm = '0000-00-00 00:00:00';
  String? postContentFiltered = '';
  int? postParent = 0;
  String? guid = '';
  int? menuOrder = 0;
  String? postType = 'post';
  String? postMimeType = '';
  int? commentCount = 0;
  String? filter = 'raw';

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
      {this.id,
      this.postAuthor,
      this.postDate,
      this.postDateGtm,
      this.postContent,
      this.postExcerpt,
      this.postStatus,
      this.commentStatus,
      this.postPassword,
      this.postName,
      this.toPing,
      this.pinned,
      this.postModified,
      this.postModifiedGtm,
      this.postContentFiltered,
      this.postParent,
      this.guid,
      this.menuOrder,
      this.postType,
      this.postMimeType,
      this.commentCount,
      this.filter,
      this.postTitle,
      this.author});

  Post copyWith({
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
    User? author,
  }) {
    return Post(
      id: id ?? this.id,
      postAuthor: postAuthor ?? this.postAuthor,
      postDate: postDate ?? this.postDate,
      postDateGtm: postDateGtm ?? this.postDateGtm,
      postContent: postContent ?? this.postContent,
      postTitle: postTitle ?? this.postTitle,
      postExcerpt: postExcerpt ?? this.postExcerpt,
      postStatus: postStatus ?? this.postStatus,
      commentStatus: commentStatus ?? this.commentStatus,
      postPassword: postPassword ?? this.postPassword,
      postName: postName ?? this.postName,
      toPing: toPing ?? this.toPing,
      pinned: pinned ?? this.pinned,
      postModified: postModified ?? this.postModified,
      postModifiedGtm: postModifiedGtm ?? this.postModifiedGtm,
      postContentFiltered: postContentFiltered ?? this.postContentFiltered,
      postParent: postParent ?? this.postParent,
      guid: guid ?? this.guid,
      menuOrder: menuOrder ?? this.menuOrder,
      postType: postType ?? this.postType,
      postMimeType: postMimeType ?? this.postMimeType,
      commentCount: commentCount ?? this.commentCount,
      filter: filter ?? this.filter,
      author: author ?? this.author,
    );
  }

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
      'author': author == null ? author?.toMap() : User(),
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as int,
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
      author: map['author'] == null
          ? User.fromMap(map['author'] as Map<String, dynamic>)
          : User(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(id: $id, postAuthor: $postAuthor, postDate: $postDate, postDateGtm: $postDateGtm, postContent: $postContent, postTitle: $postTitle, postExcerpt: $postExcerpt, postStatus: $postStatus, commentStatus: $commentStatus, postPassword: $postPassword, postName: $postName, toPing: $toPing, pinned: $pinned, postModified: $postModified, postModifiedGtm: $postModifiedGtm, postContentFiltered: $postContentFiltered, postParent: $postParent, guid: $guid, menuOrder: $menuOrder, postType: $postType, postMimeType: $postMimeType, commentCount: $commentCount, filter: $filter, author: $author)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Post &&
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
        other.author == author &&
        other.filter == filter;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        postAuthor.hashCode ^
        postDate.hashCode ^
        postDateGtm.hashCode ^
        postContent.hashCode ^
        postTitle.hashCode ^
        postExcerpt.hashCode ^
        postStatus.hashCode ^
        commentStatus.hashCode ^
        postPassword.hashCode ^
        postName.hashCode ^
        toPing.hashCode ^
        pinned.hashCode ^
        postModified.hashCode ^
        postModifiedGtm.hashCode ^
        postContentFiltered.hashCode ^
        postParent.hashCode ^
        guid.hashCode ^
        menuOrder.hashCode ^
        postType.hashCode ^
        postMimeType.hashCode ^
        commentCount.hashCode ^
        author.hashCode ^
        filter.hashCode;
  }
}

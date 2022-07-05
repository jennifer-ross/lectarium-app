// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:lectarium/core/base/base_model.dart';

class PaginationModel extends BaseModel {
  int page = 1;
  int limit = 1;

  PaginationModel._();

  PaginationModel({page = 1, limit = 1});

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'limit': limit,
    };
  }

  factory PaginationModel.fromMap(Map<String, dynamic> map) {
    return PaginationModel(
      page: map['page'] != null ? map['page'] as int : 1,
      limit: map['limit'] != null ? map['limit'] as int : 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaginationModel.fromJson(String source) =>
      PaginationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  PaginationModel copyWith({
    int page = 1,
    int limit = 1,
  }) {
    return PaginationModel(
      page: page,
      limit: limit,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [page, limit];
}

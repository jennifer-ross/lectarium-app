// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:lectarium/core/base/base_model.dart';

class Term extends BaseModel {
  int termId = 0;
  String name = '';
  String slug = '';
  int termGroup = 0;
  int termTaxonomyId = 0;
  String taxanomy = '';
  String description = '';
  int parent = 0;
  int count = 0;
  String filter = 'raw';

  Term._();

  Term.withObject(Term term) {
    termId = term.termId;
    name = term.name;
    slug = term.slug;
    termTaxonomyId = term.termTaxonomyId;
    taxanomy = term.taxanomy;
    description = term.description;
    parent = term.parent;
    count = term.count;
    termId = term.termId;
    filter = term.filter;
  }

  Term({
    this.termId = 0,
    this.name = '',
    this.slug = '',
    this.termGroup = 0,
    this.termTaxonomyId = 0,
    this.taxanomy = '',
    this.description = '',
    this.parent = 0,
    this.count = 0,
    this.filter = '',
  });

  Term copyWith({
    int termId = 0,
    String name = '',
    String slug = '',
    int termGroup = 0,
    int termTaxonomyId = 0,
    String taxanomy = '',
    String description = '',
    int parent = 0,
    int count = 0,
    String filter = '',
  }) {
    return Term(
      termId: termId,
      name: name,
      slug: slug,
      termGroup: termGroup,
      termTaxonomyId: termTaxonomyId,
      taxanomy: taxanomy,
      description: description,
      parent: parent,
      count: count,
      filter: filter,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'term_id': termId,
      'name': name,
      'slug': slug,
      'term_group': termGroup,
      'term_taxonomy_id': termTaxonomyId,
      'taxanomy': taxanomy,
      'description': description,
      'parent': parent,
      'count': count,
      'filter': filter,
    };
  }

  factory Term.fromMap(Map<String, dynamic> map) {
    return Term(
      termId: map['term_id'] as int,
      name: map['name'] as String,
      slug: map['slug'] as String,
      termGroup: map['term_group'] as int,
      termTaxonomyId: map['term_taxonomy_id'] as int,
      taxanomy: map['taxanomy'] as String,
      description: map['description'] as String,
      parent: map['parent'] as int,
      count: map['count'] as int,
      filter: map['filter'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Term.fromJson(String source) =>
      Term.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      termId,
      name,
      slug,
      termGroup,
      termTaxonomyId,
      taxanomy,
      description,
      parent,
      count,
      filter,
    ];
  }
}

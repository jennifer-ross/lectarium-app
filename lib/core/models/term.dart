// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Term {
  int? termId = 0;
  String? name = '';
  String? slug = '';
  int? termGroup = 0;
  int? termTaxonomyId = 0;
  String? taxanomy = '';
  String? description = '';
  int? parent = 0;
  int? count = 0;
  String? filter = 'raw';

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
    this.termId,
    this.name,
    this.slug,
    this.termGroup,
    this.termTaxonomyId,
    this.taxanomy,
    this.description,
    this.parent,
    this.count,
    this.filter,
  });

  Term copyWith({
    int? termId,
    String? name,
    String? slug,
    int? termGroup,
    int? termTaxonomyId,
    String? taxanomy,
    String? description,
    int? parent,
    int? count,
    String? filter,
  }) {
    return Term(
      termId: termId ?? this.termId,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      termGroup: termGroup ?? this.termGroup,
      termTaxonomyId: termTaxonomyId ?? this.termTaxonomyId,
      taxanomy: taxanomy ?? this.taxanomy,
      description: description ?? this.description,
      parent: parent ?? this.parent,
      count: count ?? this.count,
      filter: filter ?? this.filter,
    );
  }

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
  String toString() {
    return 'Term(termId: $termId, name: $name, slug: $slug, termGroup: $termGroup, termTaxonomyId: $termTaxonomyId, taxanomy: $taxanomy, description: $description, parent: $parent, count: $count, filter: $filter)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Term &&
        other.termId == termId &&
        other.name == name &&
        other.slug == slug &&
        other.termGroup == termGroup &&
        other.termTaxonomyId == termTaxonomyId &&
        other.taxanomy == taxanomy &&
        other.description == description &&
        other.parent == parent &&
        other.count == count &&
        other.filter == filter;
  }

  @override
  int get hashCode {
    return termId.hashCode ^
        name.hashCode ^
        slug.hashCode ^
        termGroup.hashCode ^
        termTaxonomyId.hashCode ^
        taxanomy.hashCode ^
        description.hashCode ^
        parent.hashCode ^
        count.hashCode ^
        filter.hashCode;
  }
}

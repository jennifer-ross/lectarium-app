// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:lectarium/core/base/base_model.dart';

class CourseProgress extends BaseModel {
  double percentage = 0;
  int completed = 0;
  int total = 0;

  CourseProgress._();

  CourseProgress.withObject(CourseProgress progress) {
    percentage = progress.percentage;
    completed = progress.completed;
    total = progress.total;
  }

  CourseProgress({
    this.percentage = 0,
    this.completed = 0,
    this.total = 0,
  });

  CourseProgress copyWith({
    double percentage = 0,
    int completed = 0,
    int total = 0,
  }) {
    return CourseProgress(
      percentage: percentage,
      completed: completed,
      total: total,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'percentage': percentage,
      'completed': completed,
      'total': total,
    };
  }

  factory CourseProgress.fromMap(Map<String, dynamic> map) {
    return CourseProgress(
      percentage: map['percentage'] != null
          ? (map['percentage'] as num).toDouble()
          : 0.0,
      completed: map['completed'] != null ? map['completed'] as int : 0,
      total: map['total'] != null ? map['total'] as int : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseProgress.fromJson(String source) =>
      CourseProgress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [percentage, completed, total];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CourseProgress {
  int? percentage = 0;
  int? completed = 0;
  int? total = 0;

  CourseProgress({
    this.percentage = 0,
    this.completed = 0,
    this.total = 0,
  });

  CourseProgress copyWith({
    int? percentage,
    int? completed,
    int? total,
  }) {
    return CourseProgress(
      percentage: percentage ?? this.percentage,
      completed: completed ?? this.completed,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'percentage': percentage,
      'completed': completed,
      'total': total,
    };
  }

  factory CourseProgress.fromMap(Map<String, dynamic> map) {
    return CourseProgress(
      percentage: map['percentage'] as int,
      completed: map['completed'] as int,
      total: map['total'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseProgress.fromJson(String source) =>
      CourseProgress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CourseProgress(percentage: $percentage, completed: $completed, total: $total)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CourseProgress &&
        other.percentage == percentage &&
        other.completed == completed &&
        other.total == total;
  }

  @override
  int get hashCode => percentage.hashCode ^ completed.hashCode ^ total.hashCode;
}

import 'package:stat_edu_mobile/sources.dart';

class StudentsOtmCourseModel extends StudentOtmCourseEntity {
  StudentsOtmCourseModel({
    required super.ownership,
    required super.course1Count,
    required super.course2Count,
    required super.course3Count,
    required super.course4Count,
    required super.course5Count,
    required super.course6Count,
  });

  factory StudentsOtmCourseModel.fromJson(Map<String, dynamic> json) =>
      StudentsOtmCourseModel(
        ownership: json['ownership'],
        course1Count: json['course1Count'] ?? 0,
        course2Count: json['course2Count'] ?? 0,
        course3Count: json['course3Count'] ?? 0,
        course4Count: json['course4Count'] ?? 0,
        course5Count: json['course5Count'] ?? 0,
        course6Count: json['course6Count'] ?? 0,
      );
}

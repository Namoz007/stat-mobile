import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class StudentCourseModel extends StudentCourseEntity {
  StudentCourseModel({
    required super.eduType,
    required super.name,
    required super.count,
  });

  factory StudentCourseModel.empty() =>
      StudentCourseModel(eduType: '', name: '', count: 0);

  factory StudentCourseModel.fromJson(Map<String, dynamic> json) =>
      StudentCourseModel(
        eduType: json['eduType'],
        name: json['name'],
        count: json['count'],
      );

  factory StudentCourseModel.fromJsonForGender(Map<String, dynamic> json) =>
      StudentCourseModel(
        eduType: json['eduForm'],
        name: json['name'],
        count: json['count'],
      );

  factory StudentCourseModel.fromJsonForPaymentForm(
    Map<String, dynamic> json,
  ) => StudentCourseModel(
    eduType: json['paymentType'],
    name: json['name'],
    count: json['count'],
  );

  factory StudentCourseModel.fromJsonForCitizenship(
    Map<String, dynamic> json,
  ) => StudentCourseModel(
    eduType: json['citizenship'],
    name: json['name'],
    count: json['count'],
  );

  factory StudentCourseModel.fromJsonForCourses(Map<String, dynamic> json) =>
      StudentCourseModel(
        eduType: json['course'],
        name: json['name'],
        count: json['count'],
      );

  factory StudentCourseModel.fromJsonForAge(Map<String, dynamic> json) =>
      StudentCourseModel(
        eduType: json['age'],
        name: json['name'],
        count: json['count'],
      );

  factory StudentCourseModel.fromJsonForResidenceType(
    Map<String, dynamic> json,
  ) => StudentCourseModel(
    eduType: json['accommodation'],
    name: json['name'],
    count: json['count'],
  );
}

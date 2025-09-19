import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class ProfessionalCourseModel extends ProfessionalCourseEntity {
  ProfessionalCourseModel({
    required super.course1,
    required super.course2,
    required super.course3,
    required super.educaiton_type,
    required super.empty,
  });

  factory ProfessionalCourseModel.empty() => ProfessionalCourseModel(
    course1: 0,
    course2: 0,
    course3: 0,
    educaiton_type: '',
    empty: true,
  );

  factory ProfessionalCourseModel.fromJson(Map<String, dynamic> json) =>
      ProfessionalCourseModel(
        course1: json['course1'],
        course2: json['course2'],
        course3: json['course3'],
        educaiton_type: json['education_type'].toString(),
        empty: false,
      );

  factory ProfessionalCourseModel.fromJsonForPayment(Map<String, dynamic> json) =>
      ProfessionalCourseModel(
        course1: json['course1'],
        course2: json['course2'],
        course3: json['course3'],
        educaiton_type: json['admission_type'].toString(),
        empty: false,
      );

  factory ProfessionalCourseModel.fromJsonForCitizenship(Map<String, dynamic> json) =>
      ProfessionalCourseModel(
        course1: json['course1'],
        course2: json['course2'],
        course3: json['course3'],
        educaiton_type: json['citizenship'].toString(),
        empty: false,
      );

  factory ProfessionalCourseModel.fromJsonForArea(Map<String, dynamic> json) =>
      ProfessionalCourseModel(
        course1: json['course1'],
        course2: json['course2'],
        course3: json['course3'],
        educaiton_type: json['region'].toString(),
        empty: false,
      );
}

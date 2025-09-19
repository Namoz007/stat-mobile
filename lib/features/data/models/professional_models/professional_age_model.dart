import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class ProfessionalAgeModel extends ProfessionalAgeEntity {
  ProfessionalAgeModel({
    required super.gt_20,
    required super.lte_20,
    required super.education_type,
    required super.empty,
  });

  factory ProfessionalAgeModel.empty() =>
      ProfessionalAgeModel(gt_20: 0, lte_20: 0, education_type: '', empty: true);

  factory ProfessionalAgeModel.fromJson(Map<String, dynamic> json) =>
      ProfessionalAgeModel(
        gt_20: json['gt_20'],
        lte_20: json['lte_20'],
        education_type: json['education_type'].toString(),
        empty: false,
      );
  
  factory ProfessionalAgeModel.fromJsonForAge(Map<String,dynamic> json) => ProfessionalAgeModel(gt_20: json['gt_20'], lte_20: json['lte_20'], education_type: json['gender'].toString(), empty: false);

  factory ProfessionalAgeModel.fromJsonForPayment(Map<String, dynamic> json) =>
      ProfessionalAgeModel(
        gt_20: json['gt_20'],
        lte_20: json['lte_20'],
        education_type: json['admission_type'].toString(),
        empty: false,
      );

  factory ProfessionalAgeModel.fromJsonForCourse(Map<String, dynamic> json) =>
      ProfessionalAgeModel(
        gt_20: json['gt_20'],
        lte_20: json['lte_20'],
        education_type: json['course'].toString(),
        empty: false,
      );

  factory ProfessionalAgeModel.fromJsonForCitizenship(Map<String, dynamic> json) =>
      ProfessionalAgeModel(
        gt_20: json['gt_20'],
        lte_20: json['lte_20'],
        education_type: json['citizenship'].toString(),
        empty: false,
      );

  factory ProfessionalAgeModel.fromJsonForArea(Map<String, dynamic> json) =>
      ProfessionalAgeModel(
        gt_20: json['gt_20'],
        lte_20: json['lte_20'],
        education_type: json['region'].toString(),
        empty: false,
      );
}

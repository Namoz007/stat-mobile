import 'package:stat_edu_mobile/sources.dart';

class ProfessionalGenderModel extends ProfessionalGenderEntity {
  ProfessionalGenderModel({
    required super.maleCount,
    required super.femaleCount,
    required super.allCount,
    required super.education_type,
    required super.empty,
  });

  factory ProfessionalGenderModel.empty() => ProfessionalGenderModel(
    maleCount: 0,
    femaleCount: 0,
    allCount: 0,
    education_type: '',
    empty: true,
  );
  

  factory ProfessionalGenderModel.fromJson(Map<String, dynamic> json) =>
      ProfessionalGenderModel(
        maleCount: json['male'],
        femaleCount: json['female'],
        allCount: json['all'],
        education_type: json['education_type'].toString(),
        empty: false,
      );

  factory ProfessionalGenderModel.fromJsonForPayment(Map<String, dynamic> json) =>
      ProfessionalGenderModel(
        maleCount: json['male'],
        femaleCount: json['female'],
        allCount: json['all'],
        education_type: json['admission_type'].toString(),
        empty: false,
      );

  factory ProfessionalGenderModel.fromJsonForCourse(Map<String,dynamic> json) => ProfessionalGenderModel(
    maleCount: json['male'],
    femaleCount: json['female'],
    allCount: json['all'],
    education_type: json['course'].toString(),
    empty: false,
  );

  factory ProfessionalGenderModel.fromJsonForCitizenship(Map<String,dynamic> json) => ProfessionalGenderModel(
    maleCount: json['male'],
    femaleCount: json['female'],
    allCount: json['all'],
    education_type: json['citizenship'].toString(),
    empty: false,
  );

  factory ProfessionalGenderModel.fromJsonForArea(Map<String,dynamic> json) => ProfessionalGenderModel(
    maleCount: json['male'],
    femaleCount: json['female'],
    allCount: json['all'],
    education_type: json['region'],
    empty: false,
  );
}

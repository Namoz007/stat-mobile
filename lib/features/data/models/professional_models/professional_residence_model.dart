import 'package:stat_edu_mobile/features/domain/entities/professional_entities/professional_residence_entity.dart';

class ProfessionalResidenceModel extends ProfessionalResidenceEntity {
  ProfessionalResidenceModel({
    required super.otherLiveCount,
    required super.houseLiveCount,
    required super.studentsHouseLiveCount,
    required super.rentalHouseLiveCount,
    required super.relativeHouseLiveCount,
    required super.familiarHouseLiveCount,
    required super.education_type,
    required super.empty,
  });

  factory ProfessionalResidenceModel.empty() => ProfessionalResidenceModel(
    otherLiveCount: 0,
    houseLiveCount: 0,
    studentsHouseLiveCount: 0,
    rentalHouseLiveCount: 0,
    relativeHouseLiveCount: 0,
    familiarHouseLiveCount: 0,
    education_type: '',
    empty: true,
  );

  factory ProfessionalResidenceModel.fromJson(Map<String, dynamic> json) =>
      ProfessionalResidenceModel(
        otherLiveCount: json['9'],
        houseLiveCount: json['10'],
        studentsHouseLiveCount: json['14'],
        rentalHouseLiveCount: json['13'],
        relativeHouseLiveCount: json['11'],
        familiarHouseLiveCount: json['12'],
        education_type: json['education_type'].toString(),
        empty: false,
      );

  factory ProfessionalResidenceModel.fromJsonForPayment(Map<String, dynamic> json) =>
      ProfessionalResidenceModel(
        otherLiveCount: json['9'],
        houseLiveCount: json['10'],
        studentsHouseLiveCount: json['14'],
        rentalHouseLiveCount: json['13'],
        relativeHouseLiveCount: json['11'],
        familiarHouseLiveCount: json['12'],
        education_type: json['admission_type'].toString(),
        empty: false,
      );

  factory ProfessionalResidenceModel.fromJsonForCourse(Map<String, dynamic> json) =>
      ProfessionalResidenceModel(
        otherLiveCount: json['9'],
        houseLiveCount: json['10'],
        studentsHouseLiveCount: json['14'],
        rentalHouseLiveCount: json['13'],
        relativeHouseLiveCount: json['11'],
        familiarHouseLiveCount: json['12'],
        education_type: json['course'].toString(),
        empty: false,
      );

  factory ProfessionalResidenceModel.fromJsonForCitizenship(Map<String, dynamic> json) =>
      ProfessionalResidenceModel(
        otherLiveCount: json['9'],
        houseLiveCount: json['10'],
        studentsHouseLiveCount: json['14'],
        rentalHouseLiveCount: json['13'],
        relativeHouseLiveCount: json['11'],
        familiarHouseLiveCount: json['12'],
        education_type: json['citizenship'].toString(),
        empty: false,
      );

  factory ProfessionalResidenceModel.fromJsonForArea(Map<String, dynamic> json) =>
      ProfessionalResidenceModel(
        otherLiveCount: json['9'],
        houseLiveCount: json['10'],
        studentsHouseLiveCount: json['14'],
        rentalHouseLiveCount: json['13'],
        relativeHouseLiveCount: json['11'],
        familiarHouseLiveCount: json['12'],
        education_type: json['region'].toString(),
        empty: false,
      );
}

import 'package:stat_edu_mobile/sources.dart';

class ProfessionalEducationFormResponseModel
    extends ProfessionalEducationFormResponseEntity {
  ProfessionalEducationFormResponseModel({
    required super.genderData,
    required super.ageData,
    required super.admissionData,
    required super.courseData,
    required super.citizenshipData,
    required super.residenceData,
    required super.empty,
  });

  factory ProfessionalEducationFormResponseModel.empty() =>
      ProfessionalEducationFormResponseModel(
        genderData: [],
        ageData: [],
        admissionData: [],
        courseData: [],
        citizenshipData: [],
        residenceData: [],
        empty: true,
      );

  factory ProfessionalEducationFormResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => ProfessionalEducationFormResponseModel(
    genderData: List.from(
      json['by_gender'].map((value) => ProfessionalGenderModel.fromJson(value)),
    ),
    ageData: List.from(
      json['by_age'].map((value) => ProfessionalAgeModel.fromJson(value)),
    ),
    admissionData: List.from(
      json['by_admission_type'].map((value) => ProfessionalAdmissionTypeModel.fromJson(value)),
    ),
    courseData: List.from(
      json['by_course'].map((value) => ProfessionalCourseModel.fromJson(value)),
    ),
    citizenshipData: List.from(
      json['by_citizenship'].map((value) => ProfessionalCitizenshipModel.fromJson(value)),
    ),
    residenceData: List.from(
      json['by_current_live_place'].map((value) => ProfessionalResidenceModel.fromJson(value)),
    ),
    empty: false
  );
}

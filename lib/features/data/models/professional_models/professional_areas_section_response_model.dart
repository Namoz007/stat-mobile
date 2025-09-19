import 'package:stat_edu_mobile/sources.dart';

class ProfessionalAreasSectionResponseModel
    extends ProfessionalAreasSectionResponseEntity {
  ProfessionalAreasSectionResponseModel({
    required super.genderData,
    required super.ageData,
    required super.admissionData,
    required super.coursesData,
    required super.citizenshipData,
    required super.residenceData,
    required super.educationFormData,
    required super.educationTypeData,
    required super.empty,
  });

  factory ProfessionalAreasSectionResponseModel.empty() =>
      ProfessionalAreasSectionResponseModel(
        genderData: [],
        ageData: [],
        admissionData: [],
        coursesData: [],
        citizenshipData: [],
        residenceData: [],
        educationFormData: [],
        educationTypeData: [],
        empty: true,
      );

  factory ProfessionalAreasSectionResponseModel.fromJson(Map<String, dynamic> json,) => ProfessionalAreasSectionResponseModel(
    genderData: List.from((json['by_gender'] as List<dynamic>).map((value) => ProfessionalGenderModel.fromJsonForArea(value))),
    ageData: List.from((json['by_age'] as List<dynamic>).map((value) => ProfessionalAgeModel.fromJsonForArea(value))),
    admissionData: List.from((json['by_admission_type'] as List<dynamic>).map((value) => ProfessionalAdmissionTypeModel.fromJsonForArea(value))),
    coursesData: List.from((json['by_course'] as List<dynamic>).map((value) => ProfessionalCourseModel.fromJsonForArea(value))),
    citizenshipData: List.from((json['by_citizenship'] as List<dynamic>).map((value) => ProfessionalCitizenshipModel.fromJsonForArea(value))),
    residenceData: List.from((json['by_current_live_place'] as List<dynamic>).map((value) => ProfessionalResidenceModel.fromJsonForArea(value))),
    educationFormData: List.from((json['by_education_form'] as List<dynamic>).map((value) => ProfessionalAreaEducationFormModel.fromJson(value))),
    educationTypeData: List.from((json['by_education_type'] as List<dynamic>).map((value) => ProfessionalEducationTypeModel.fromJson(value))),
    empty: false,
  );
}

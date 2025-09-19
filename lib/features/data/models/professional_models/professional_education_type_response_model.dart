import 'package:stat_edu_mobile/sources.dart';

class ProfessionalEducationTypeResponseModel
    extends ProfessionalEducationTypeResponseEntity {
  ProfessionalEducationTypeResponseModel({
    required super.collegeData,
    required super.technicalCollegeData,
    required super.collegeAgeData,
    required super.technicalCollegeAgeData,
    required super.collegeAdmissionData,
    required super.technicalCollegeAdmissionData,
    required super.collegeCourseData,
    required super.technicalCollegeCourseData,
    required super.collegeCitizenshipData,
    required super.technicalCollegeCitizenshipData,
    required super.collegeResidenceData,
    required super.technicalCollegeResidenceData,
    required super.collegeEducationFormData,
    required super.technicalCollegeEducationFormData,
    required super.empty,
  });

  factory ProfessionalEducationTypeResponseModel.empty() =>
      ProfessionalEducationTypeResponseModel(
        collegeData: ProfessionalGenderModel.empty(),
        technicalCollegeData: ProfessionalGenderModel.empty(),
        collegeAgeData: ProfessionalAgeModel.empty(),
        technicalCollegeAgeData: ProfessionalAgeModel.empty(),
        collegeAdmissionData: ProfessionalAdmissionTypeModel.empty(),
        technicalCollegeAdmissionData: ProfessionalAdmissionTypeModel.empty(),
        collegeCourseData: ProfessionalCourseModel.empty(),
        technicalCollegeCourseData: ProfessionalCourseModel.empty(),
        collegeCitizenshipData: ProfessionalCitizenshipModel.empty(),
        technicalCollegeCitizenshipData: ProfessionalCitizenshipModel.empty(),
        collegeResidenceData: ProfessionalResidenceModel.empty(),
        technicalCollegeResidenceData: ProfessionalResidenceModel.empty(),
        collegeEducationFormData: ProfessionalEducationFormModel.empty(),
        technicalCollegeEducationFormData:
            ProfessionalEducationFormModel.empty(),
        empty: true,
      );

  factory ProfessionalEducationTypeResponseModel.fromJson(Map<String,dynamic> json) => ProfessionalEducationTypeResponseModel(
    collegeData: (json['by_gender'] as List<dynamic>).indexWhere((value) => value['education_type'] == 4) != -1 ? ProfessionalGenderModel.fromJson(json['by_gender'][(json['by_gender'] as List<dynamic>).indexWhere((value) => value['education_type'] == 4)]) : ProfessionalGenderModel.empty(),
    technicalCollegeData: (json['by_gender'] as List<dynamic>).indexWhere((value) => value['education_type'] == 5) != -1 ? ProfessionalGenderModel.fromJson(json['by_gender'][(json['by_gender'] as List<dynamic>).indexWhere((value) => value['education_type'] == 5)]) : ProfessionalGenderModel.empty(),
    collegeAgeData: (json['by_age'] as List<dynamic>).indexWhere((value) => value['education_type'] == 4) != -1 ? ProfessionalAgeModel.fromJson(json['by_age'][(json['by_age'] as List<dynamic>).indexWhere((value) => value['education_type'] == 4)]) : ProfessionalAgeModel.empty(),
    technicalCollegeAgeData: (json['by_age'] as List<dynamic>).indexWhere((value) => value['education_type'] == 5) != -1 ? ProfessionalAgeModel.fromJson(json['by_age'][(json['by_age'] as List<dynamic>).indexWhere((value) => value['education_type'] == 5)]) : ProfessionalAgeModel.empty(),
    collegeAdmissionData: (json['by_admission_type'] as List<dynamic>).indexWhere((value) => value['education_type'] == 4) != -1 ? ProfessionalAdmissionTypeModel.fromJson(json["by_admission_type"][(json['by_admission_type'] as List<dynamic>).indexWhere((value) => value['education_type'] == 4)]) : ProfessionalAdmissionTypeModel.empty(),
    technicalCollegeAdmissionData: (json['by_admission_type'] as List<dynamic>).indexWhere((value) => value['education_type'] == 5) != -1 ? ProfessionalAdmissionTypeModel.fromJson(
      json['by_admission_type'][(json['by_admission_type'] as List<dynamic>).indexWhere((value) => value['education_type'] == 5)],
    ) : ProfessionalAdmissionTypeModel.empty(),
    collegeCourseData: (json['by_course'] as List<dynamic>).indexWhere((value) => value['education_type'] == 4) != -1 ? ProfessionalCourseModel.fromJson(json['by_course'][(json['by_course'] as List<dynamic>).indexWhere((value) => value['education_type'] == 4)]) : ProfessionalCourseModel.empty(),
    technicalCollegeCourseData: (json['by_course'] as List<dynamic>).indexWhere((value) => value['education_type'] == 5) != -1 ?ProfessionalCourseModel.fromJson(json['by_course'][(json['by_course'] as List<dynamic>).indexWhere((value) => value['education_type'] == 5)]) : ProfessionalCourseModel.empty(),
    collegeCitizenshipData:(json['by_citizenship'] as List<dynamic>).indexWhere((value) => value['education_type'] == 4) != -1 ? ProfessionalCitizenshipModel.fromJson(json['by_citizenship'][(json['by_citizenship'] as List<dynamic>).indexWhere((value) => value['education_type'] == 4)]) : ProfessionalCitizenshipModel.empty(),
    technicalCollegeCitizenshipData: (json['by_citizenship'] as List<dynamic>).indexWhere((value) => value['education_type'] == 5) != -1 ? ProfessionalCitizenshipModel.fromJson(
      json['by_citizenship'][(json['by_citizenship'] as List<dynamic>).indexWhere((value) => value['education_type'] == 5)],
    ) : ProfessionalCitizenshipModel.empty(),
    collegeResidenceData: (json['by_current_live_place'] as List<dynamic>).indexWhere((value) => value['education_type'] == 4) != -1 ? ProfessionalResidenceModel.fromJson(json['by_current_live_place'][(json['by_current_live_place'] as List<dynamic>).indexWhere((value) => value['education_type'] == 4)]) : ProfessionalResidenceModel.empty(),
    technicalCollegeResidenceData:(json['by_current_live_place'] as List<dynamic>).indexWhere((value) => value['education_type'] == 5) != -1 ? ProfessionalResidenceModel.fromJson(
      json['by_current_live_place'][(json['by_current_live_place'] as List<dynamic>).indexWhere((value) => value['education_type'] == 5)],
    ) : ProfessionalResidenceModel.empty(),
    collegeEducationFormData: (json['by_education_form'] as List<dynamic>).indexWhere((value) => value['education_type'] == 4) != -1 ?ProfessionalEducationFormModel.fromJson(json['by_education_form'][(json['by_education_form'] as List<dynamic>).indexWhere((value) => value['education_type'] == 4)]) : ProfessionalEducationFormModel.empty(),
    technicalCollegeEducationFormData:(json['by_education_form'] as List<dynamic>).indexWhere((value) => value['education_type'] == 5) != -1 ?
    ProfessionalEducationFormModel.fromJson(json['by_education_form'][(json['by_education_form'] as List<dynamic>).indexWhere((value) => value['education_type'] == 4)]) : ProfessionalEducationFormModel.empty(),
    empty: false,
  );

}

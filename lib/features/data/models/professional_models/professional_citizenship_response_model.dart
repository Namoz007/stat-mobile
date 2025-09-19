import 'package:stat_edu_mobile/sources.dart';

class ProfessionalCitizenshipResponseModel
    extends ProfessionalCitizenshipResponseEntity {
  ProfessionalCitizenshipResponseModel({
    required super.genderData,
    required super.ageData,
    required super.courseData,
    required super.residenceData,
    required super.empty,
  });

  factory ProfessionalCitizenshipResponseModel.empty() =>
      ProfessionalCitizenshipResponseModel(genderData: [],
          ageData: [],
          courseData: [],
          residenceData: [],
          empty: true);


  factory ProfessionalCitizenshipResponseModel.fromJson(
      Map<String, dynamic> json) =>
      ProfessionalCitizenshipResponseModel(
          genderData: List.from(
            json['by_gender'].map((value) => ProfessionalGenderModel.fromJsonForCitizenship(value)),
          ),
          ageData: List.from(
            json['by_age'].map((value) => ProfessionalAgeModel.fromJsonForCitizenship(value)),
          ),
          courseData: List.from(
            json['by_course'].map((value) => ProfessionalCourseModel.fromJsonForCitizenship(value)),
          ),
          residenceData: List.from(
            json['by_current_live_place'].map((value) => ProfessionalResidenceModel.fromJsonForCitizenship(value)),
          ),
          empty: false
      );


}

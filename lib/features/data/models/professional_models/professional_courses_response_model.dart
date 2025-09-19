import 'package:stat_edu_mobile/sources.dart';
class ProfessionalCoursesResponseModel
    extends ProfessionalCoursesResponseEntity {
  ProfessionalCoursesResponseModel({
    required super.genderData,
    required super.ageData,
    required super.residenceData,
    required super.empty,
  });

  factory ProfessionalCoursesResponseModel.empty() =>
      ProfessionalCoursesResponseModel(
        genderData: [],
        ageData: [],
        residenceData: [],
        empty: true,
      );

  factory ProfessionalCoursesResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => ProfessionalCoursesResponseModel(
    genderData: List.from(
      json['by_gender'].map((value) => ProfessionalGenderModel.fromJsonForCourse(value)),
    ),
    ageData: List.from(
      json['by_age'].map((value) => ProfessionalAgeModel.fromJsonForCourse(value)),
    ),
    residenceData: List.from(
      json['by_current_live_place'].map((value) => ProfessionalResidenceModel.fromJsonForCourse(value)),
    ),
    empty: false,
  );
}

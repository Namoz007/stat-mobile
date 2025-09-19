import 'package:stat_edu_mobile/sources.dart';

class ProfessionalAgeResponseModel extends ProfessionalAgeResponseEntity {
  ProfessionalAgeResponseModel({
    required super.genderData,
    required super.residenceData,
    required super.empty,
  });

  factory ProfessionalAgeResponseModel.empty() =>
      ProfessionalAgeResponseModel(genderData: [], residenceData: [],empty: true);

  factory ProfessionalAgeResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfessionalAgeResponseModel(
        genderData: List.from(
          (json['by_gender'] as List<dynamic>).map(
            (value) => ProfessionalAgeModel.fromJsonForAge(value),
          ),
        ),
        residenceData: List.from((json['by_current_live_place'] as List<dynamic>).map((value) => ProfessionalLivePlaceModel.fromJson(value))),
        empty: false,
      );
}

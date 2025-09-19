import 'package:stat_edu_mobile/sources.dart';

class ProfessionalResidenceAreaResponseModel
    extends ProfessionalResidenceAreaResponseEntity {
  ProfessionalResidenceAreaResponseModel({required super.genderData,required super.empty,});

  factory ProfessionalResidenceAreaResponseModel.empty() =>
      ProfessionalResidenceAreaResponseModel(genderData: [],empty: true);

  factory ProfessionalResidenceAreaResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => ProfessionalResidenceAreaResponseModel(
    genderData: List.from(
      (json['by_gender'] as List<dynamic>).map(
        (value) => ProfessionalLivePlaceModel.fromJsonForGenderData(value),
      ),
    ),
    empty: false,
  );
}

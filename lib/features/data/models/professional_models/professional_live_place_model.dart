import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class ProfessionalLivePlaceModel extends ProfessionalLivePlaceEntity {
  ProfessionalLivePlaceModel({
    required super.gt_20,
    required super.lte_20,
    required super.current_live_place_code,
    required super.current_live_place,
  });

  factory ProfessionalLivePlaceModel.fromJson(Map<String, dynamic> json) =>
      ProfessionalLivePlaceModel(
        gt_20: json['gt_20'],
        lte_20: json['lte_20'],
        current_live_place_code: json['current_live_place_code'],
        current_live_place: json['current_live_place'],
      );

  factory ProfessionalLivePlaceModel.fromJsonForGenderData(Map<String,dynamic> json) => ProfessionalLivePlaceModel(
    gt_20: json['male'],
    lte_20: json['female'],
    current_live_place_code: json['current_live_place_code'],
    current_live_place: json['current_live_place'],
  );
}

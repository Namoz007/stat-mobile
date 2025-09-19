import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class OtmGenderModel extends OtmGenderEntity {
  OtmGenderModel({
    required super.ownership,
    required super.maleCount,
    required super.femaleCount,
  });

  factory OtmGenderModel.fromJson(Map<String, dynamic> json) => OtmGenderModel(
    ownership: json['ownership'],
    maleCount: json['maleCount'],
    femaleCount: json['femaleCount'],
  );
}

import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class OtmEducationTypeModel extends OtmEducationTypeEntity {
  OtmEducationTypeModel({
    required super.ownership,
    required super.bachelorCount,
    required super.masterDegreeCount,
    required super.residencyCount,
  });

  factory OtmEducationTypeModel.fromJson(Map<String, dynamic> json) =>
      OtmEducationTypeModel(
        ownership: json['ownership'],
        bachelorCount: json['bachelorCount'],
        masterDegreeCount: json['masterCount'],
        residencyCount: json['masterCount'],
      );
}

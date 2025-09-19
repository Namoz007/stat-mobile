import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class ProfessionalEducationTypeModel extends ProfessionalEducationTypeEntity {
  ProfessionalEducationTypeModel({
    required super.khm,
    required super.college,
    required super.technical,
    required super.region,
  });

  factory ProfessionalEducationTypeModel.fromJson(Map<String, dynamic> json) =>
      ProfessionalEducationTypeModel(
        khm: json['khm'],
        college: json['college'],
        technical: json['technical'],
        region: json['region'],
      );
}

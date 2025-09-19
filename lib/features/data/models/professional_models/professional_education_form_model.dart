import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class ProfessionalEducationFormModel extends ProfessionalEducationFormEntity {
  ProfessionalEducationFormModel({
    required super.day_time,
    required super.external,
    required super.evening,
    required super.dual,
    required super.education_type,
    required super.empty,
  });

  factory ProfessionalEducationFormModel.empty() =>
      ProfessionalEducationFormModel(
        day_time: 0,
        external: 0,
        evening: 0,
        dual: 0,
        education_type: 0,
        empty: true,
      );

  factory ProfessionalEducationFormModel.fromJson(Map<String, dynamic> json) => ProfessionalEducationFormModel(
    day_time: json['day_time'] ?? 0,
    external: json['external'],
    evening: json['evening'],
    dual: json['dual'],
    education_type: json['education_type'],
    empty: false,
  );

  factory ProfessionalEducationFormModel.fromJsonForArea(Map<String, dynamic> json) => ProfessionalEducationFormModel(
    day_time: json['day_time'] ?? 0,
    external: json['external'] ?? 0,
    evening: json['evening'] ?? 0,
    dual: json['dual'] ?? 0,
    education_type: json['region'] ?? 0,
    empty: false,
  );

}

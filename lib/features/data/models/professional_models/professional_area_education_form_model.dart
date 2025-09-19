import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class ProfessionalAreaEducationFormModel
    extends ProfessionalAreaEducationFormEntity {
  ProfessionalAreaEducationFormModel({
    required super.day_time,
    required super.external,
    required super.evening,
    required super.dual,
    required super.region,
  });

  factory ProfessionalAreaEducationFormModel.fromJson(
    Map<String, dynamic> json,
  ) => ProfessionalAreaEducationFormModel(
    day_time: json['day_time'],
    external: json['external'],
    evening: json['evening'],
    dual: json['dual'],
    region: json['region'],
  );
}

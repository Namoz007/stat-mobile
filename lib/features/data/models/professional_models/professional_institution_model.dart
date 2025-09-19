import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class ProfessionalInstitutionModel extends ProfessionalInstitutionEntity {
  ProfessionalInstitutionModel({
    required super.id,
    required super.region_id,
    required super.name_uz,
    required super.name_en,
    required super.name_ru,
    required super.ownership_form,
    required super.education_type,
    required super.website,
  });

  factory ProfessionalInstitutionModel.fromJson(Map<String, dynamic> json) =>
      ProfessionalInstitutionModel(
        id: json['id'],
        region_id: json['region_id'],
        name_uz: json['name_uz'],
        name_en: json['name_en'],
        name_ru: json['name_ru'],
        ownership_form: json['ownership_form'],
        education_type: json['education_type'],
        website: json['website'],
      );
}

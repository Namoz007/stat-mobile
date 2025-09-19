abstract class ProfessionalInstitutionEntity {
  int id;
  int region_id;
  String name_uz;
  String name_en;
  String name_ru;
  int ownership_form;
  int education_type;
  String website;

  ProfessionalInstitutionEntity({
    required this.id,
    required this.region_id,
    required this.name_uz,
    required this.name_en,
    required this.name_ru,
    required this.ownership_form,
    required this.education_type,
    required this.website,
  });
}

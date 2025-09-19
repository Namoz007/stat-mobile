abstract class ProfessionalAgeEntity {
  int gt_20;
  int lte_20;
  String education_type;
  bool empty;

  ProfessionalAgeEntity({
    required this.gt_20,
    required this.lte_20,
    required this.education_type,
    required this.empty,
  });
}

abstract class ProfessionalGenderEntity {
  int maleCount;
  int femaleCount;
  int allCount;
  String education_type;
  bool empty;

  ProfessionalGenderEntity({
    required this.maleCount,
    required this.femaleCount,
    required this.allCount,
    required this.education_type,
    required this.empty,
  });
}

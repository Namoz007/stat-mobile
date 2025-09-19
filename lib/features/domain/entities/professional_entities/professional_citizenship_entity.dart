abstract class ProfessionalCitizenshipEntity {
  int countyCitizenshipCount;
  int foreignCitizenshipCount;
  int notCitizenshipCount;
  int minorCount;
  String education_type;
  bool empty;

  ProfessionalCitizenshipEntity({
    required this.countyCitizenshipCount,
    required this.foreignCitizenshipCount,
    required this.notCitizenshipCount,
    required this.minorCount,
    required this.education_type,
    required this.empty,
  });
}

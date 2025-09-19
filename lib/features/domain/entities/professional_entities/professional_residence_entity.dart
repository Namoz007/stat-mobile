abstract class ProfessionalResidenceEntity {
  int otherLiveCount;
  int houseLiveCount;
  int studentsHouseLiveCount;
  int rentalHouseLiveCount;
  int relativeHouseLiveCount;
  int familiarHouseLiveCount;
  String education_type;
  bool empty;

  ProfessionalResidenceEntity({
    required this.otherLiveCount,
    required this.houseLiveCount,
    required this.studentsHouseLiveCount,
    required this.rentalHouseLiveCount,
    required this.relativeHouseLiveCount,
    required this.familiarHouseLiveCount,
    required this.education_type,
    required this.empty,
  });
}

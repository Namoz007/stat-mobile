import "package:stat_edu_mobile/sources.dart";

abstract class ProfessionalEducationFormResponseEntity {
  List<ProfessionalGenderEntity> genderData;
  List<ProfessionalAgeEntity> ageData;
  List<ProfessionalAdmissionTypeEntity> admissionData;
  List<ProfessionalCourseEntity> courseData;
  List<ProfessionalCitizenshipEntity> citizenshipData;
  List<ProfessionalResidenceEntity> residenceData;
  bool empty;

  ProfessionalEducationFormResponseEntity({
    required this.genderData,
    required this.ageData,
    required this.admissionData,
    required this.courseData,
    required this.citizenshipData,
    required this.residenceData,
    required this.empty
  });
}

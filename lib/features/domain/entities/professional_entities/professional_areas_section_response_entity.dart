import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

abstract class ProfessionalAreasSectionResponseEntity {
  List<ProfessionalGenderEntity> genderData;
  List<ProfessionalAgeEntity> ageData;
  List<ProfessionalAdmissionTypeEntity> admissionData;
  List<ProfessionalCourseEntity> coursesData;
  List<ProfessionalCitizenshipEntity> citizenshipData;
  List<ProfessionalResidenceEntity> residenceData;
  List<ProfessionalAreaEducationFormEntity> educationFormData;
  List<ProfessionalEducationTypeEntity> educationTypeData;
  bool empty;

  ProfessionalAreasSectionResponseEntity({
    required this.genderData,
    required this.ageData,
    required this.admissionData,
    required this.coursesData,
    required this.citizenshipData,
    required this.residenceData,
    required this.educationFormData,
    required this.educationTypeData,
    required this.empty,
  });
}

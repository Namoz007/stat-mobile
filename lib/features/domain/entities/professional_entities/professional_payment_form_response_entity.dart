import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

abstract class ProfessionalPaymentFormResponseEntity {
  List<ProfessionalGenderEntity> genderData;
  List<ProfessionalAgeEntity> ageData;
  List<ProfessionalCourseEntity> courseData;
  List<ProfessionalCitizenshipEntity> citizenshipData;
  List<ProfessionalResidenceEntity> residenceData;
  bool empty;

  ProfessionalPaymentFormResponseEntity({
    required this.genderData,
    required this.ageData,
    required this.courseData,
    required this.citizenshipData,
    required this.residenceData,
    required this.empty,
  });
}

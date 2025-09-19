import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

abstract class ProfessionalCitizenshipResponseEntity {
  List<ProfessionalGenderEntity> genderData;
  List<ProfessionalAgeEntity> ageData;
  List<ProfessionalCourseEntity> courseData;
  List<ProfessionalResidenceEntity> residenceData;
  bool empty;

  ProfessionalCitizenshipResponseEntity({
    required this.genderData,
    required this.ageData,
    required this.courseData,
    required this.residenceData,
    required this.empty,
  });

}

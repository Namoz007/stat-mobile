import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

abstract class ProfessionalCoursesResponseEntity {
  List<ProfessionalGenderEntity> genderData;
  List<ProfessionalAgeEntity> ageData;
  List<ProfessionalResidenceEntity> residenceData;
  bool empty;

  ProfessionalCoursesResponseEntity({
    required this.genderData,
    required this.ageData,
    required this.residenceData,
    required this.empty,
  });
}

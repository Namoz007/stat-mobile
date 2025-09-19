import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

abstract class ProfessionalAgeResponseEntity {
  List<ProfessionalAgeEntity> genderData;
  List<ProfessionalLivePlaceEntity> residenceData;
  bool empty;

  ProfessionalAgeResponseEntity({
    required this.genderData,
    required this.residenceData,
    required this.empty,
  });
}

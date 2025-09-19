import "package:stat_edu_mobile/sources.dart";

abstract class ProfessionalResidenceAreaResponseEntity {
  List<ProfessionalLivePlaceEntity> genderData;
  bool empty;

  ProfessionalResidenceAreaResponseEntity({required this.genderData,required this.empty,});
}

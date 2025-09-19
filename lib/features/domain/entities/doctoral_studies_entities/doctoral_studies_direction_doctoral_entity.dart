import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

abstract class DoctoralStudiesDirectionDoctoralEntity {
  LanguageNameEntity name;
  int id;
  String code;
  int doctoral;
  int supportDoctoral;
  int internResearch;
  int independentResearcherDSC;
  int independentResearcherPHD;
  int targetDoctoralDSC;
  int targetSupportDoctoralPHD;
  int total;

  DoctoralStudiesDirectionDoctoralEntity({
    required this.name,
    required this.id,
    required this.code,
    required this.doctoral,
    required this.supportDoctoral,
    required this.internResearch,
    required this.independentResearcherDSC,
    required this.independentResearcherPHD,
    required this.targetDoctoralDSC,
    required this.targetSupportDoctoralPHD,
    required this.total,
  });
}

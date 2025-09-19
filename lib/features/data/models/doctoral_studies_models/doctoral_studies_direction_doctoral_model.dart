import 'package:stat_edu_mobile/sources.dart';

class DoctoralStudiesDirectionDoctoralModel
    extends DoctoralStudiesDirectionDoctoralEntity {
  DoctoralStudiesDirectionDoctoralModel({
    required super.name,
    required super.id,
    required super.code,
    required super.doctoral,
    required super.supportDoctoral,
    required super.internResearch,
    required super.independentResearcherDSC,
    required super.independentResearcherPHD,
    required super.targetDoctoralDSC,
    required super.targetSupportDoctoralPHD,
    required super.total,
  });

  factory DoctoralStudiesDirectionDoctoralModel.fromJson(
    Map<String, dynamic> json,
  ) => DoctoralStudiesDirectionDoctoralModel(
    name: LanguageNameModel.fromJson(json['name']),
    id: json['id'],
    code: json['code'],
    doctoral: json['100'],
    supportDoctoral: json['200'],
    internResearch: json['300'],
    independentResearcherDSC: json['400'],
    independentResearcherPHD: json['500'],
    targetDoctoralDSC: json['600'],
    targetSupportDoctoralPHD: json['700'],
    total: json['total'],
  );
}

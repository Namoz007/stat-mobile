import 'package:stat_edu_mobile/sources.dart';

class DoctoralStudiesProvinceEducationOrganizationModel
    extends DoctoralStudiesProvinceEducationOrganizationsEntity {
  DoctoralStudiesProvinceEducationOrganizationModel({
    required super.names,
    required super.region,
    required super.otmOrganization,
    required super.educationOrganization,
  });

  factory DoctoralStudiesProvinceEducationOrganizationModel.fromJson(
    Map<String, dynamic> json,
  ) => DoctoralStudiesProvinceEducationOrganizationModel(
    names: LanguageNameModel.fromJson(json['name']),
    region: json['region'],
    otmOrganization: json['100'],
    educationOrganization: json['200'],
  );
}

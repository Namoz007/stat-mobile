import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

abstract class DoctoralStudiesProvinceEducationOrganizationsEntity {
  LanguageNameEntity names;
  int region;
  int otmOrganization;
  int educationOrganization;

  DoctoralStudiesProvinceEducationOrganizationsEntity({
    required this.names,
    required this.region,
    required this.otmOrganization,
    required this.educationOrganization,
  });
}

import 'package:stat_edu_mobile/sources.dart';

class DoctoralStudiesOrganizationModel
    extends DoctoralStudiesOrganizationEntity {
  DoctoralStudiesOrganizationModel({
    required super.type_org_id,
    required super.org_count,
    required super.usr_org_count,
  });

  factory DoctoralStudiesOrganizationModel.fromJson(
    Map<String, dynamic> json,
  ) => DoctoralStudiesOrganizationModel(
    type_org_id: json['type_org_id'],
    org_count: json['org_count'],
    usr_org_count: json['usr_org_count'],
  );
}

import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class ProfessionalAdmissionTypeModel extends ProfessionalAdmissionTypeEntity {
  ProfessionalAdmissionTypeModel({
    required super.grandCount,
    required super.contractCount,
    required super.education_type,
    required super.empty,
  });

  factory ProfessionalAdmissionTypeModel.empty() =>
      ProfessionalAdmissionTypeModel(
        grandCount: 0,
        contractCount: 0,
        education_type: '',
        empty: true,
      );

  factory ProfessionalAdmissionTypeModel.fromJson(Map<String, dynamic> json) =>
      ProfessionalAdmissionTypeModel(
        grandCount: json['grand'],
        contractCount: json['contract'],
        education_type: json['education_type'].toString(),
        empty: false,
      );

  factory ProfessionalAdmissionTypeModel.fromJsonForArea(Map<String, dynamic> json) =>
      ProfessionalAdmissionTypeModel(
        grandCount: json['grand'],
        contractCount: json['contract'],
        education_type: json['region'].toString(),
        empty: false,
      );
}

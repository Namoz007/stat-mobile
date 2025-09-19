import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class OtmUniversityTypeModel extends OtmUniversityTypeEntity {
  OtmUniversityTypeModel({required super.name, required super.count});

  factory OtmUniversityTypeModel.fromJson(Map<String, dynamic> json) =>
      OtmUniversityTypeModel(name: json['name'], count: json['count']);
}

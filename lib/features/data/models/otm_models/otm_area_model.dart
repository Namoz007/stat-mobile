import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class OTMAreaModel extends OTMAreaEntity {
  OTMAreaModel({
    required super.regionCode,
    required super.region,
    required super.count,
  });

  factory OTMAreaModel.fromJson(Map<String, dynamic> json) => OTMAreaModel(
    regionCode: json['regionCode'],
    region: json['region'],
    count: json['count'],
  );
}

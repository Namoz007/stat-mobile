import 'package:stat_edu_mobile/sources.dart';

class RegionDataModel extends RegionDataEntity {
  RegionDataModel({
    required super.regionCode,
    required super.region,
    required super.name,
    required super.count,
  });

  factory RegionDataModel.fromJson(Map<String, dynamic> json) =>
      RegionDataModel(
        regionCode: json['regionCode'],
        region: json['region'],
        name: json['name'],
        count: json['count'],
      );
}

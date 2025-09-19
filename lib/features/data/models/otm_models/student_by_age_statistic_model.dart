import 'package:stat_edu_mobile/sources.dart';

class StudentByAgeStatisticModel extends StudentByAgeStatisticEntity {
  StudentByAgeStatisticModel({
    required super.eduType,
    required super.name,
    required super.count,
  });

  factory StudentByAgeStatisticModel.empty() =>
      StudentByAgeStatisticModel(eduType: '', name: '', count: 0);

  factory StudentByAgeStatisticModel.fromJson(Map<String, dynamic> json) =>
      StudentByAgeStatisticModel(
        eduType: json['eduType'],
        name: json['name'],
        count: json['count'],
      );
}

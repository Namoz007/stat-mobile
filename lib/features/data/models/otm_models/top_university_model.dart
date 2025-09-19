import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class TopUniversityModel extends TopUniversityEntity {
  TopUniversityModel({
    required super.universityName,
    required super.studentsCount,
  });

  factory TopUniversityModel.fromJson(Map<String, dynamic> json) =>
      TopUniversityModel(
        universityName: json['name'],
        studentsCount: json['count'],
      );
}

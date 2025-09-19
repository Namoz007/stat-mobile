import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class TeacherPositionModel extends TeacherPositionEntity {
  TeacherPositionModel({
    required super.name,
    required super.gender,
    required super.count,
  });

  factory TeacherPositionModel.empty() =>
      TeacherPositionModel(name: '', gender: '', count: 0);

  factory TeacherPositionModel.fromJson(Map<String, dynamic> json) =>
      TeacherPositionModel(
        name: json['name'],
        gender: json['gender'],
        count: json['count'],
      );

  factory TeacherPositionModel.fromJsonForAgeData(Map<String, dynamic> json) =>
      TeacherPositionModel(
        name: json['age'],
        gender: json['gender'],
        count: json['count'],
      );
}

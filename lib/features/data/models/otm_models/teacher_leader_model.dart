import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class TeacherLeaderModel extends TeacherLeaderEntity {
  TeacherLeaderModel({required super.leaderName, required super.count});

  factory TeacherLeaderModel.fromJson(Map<String, dynamic> json) =>
      TeacherLeaderModel(leaderName: json['name'], count: json['count']);

  factory TeacherLeaderModel.empty() =>
      TeacherLeaderModel(leaderName: '', count: 0);
}

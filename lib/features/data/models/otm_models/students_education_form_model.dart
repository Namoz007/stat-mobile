import 'package:stat_edu_mobile/sources.dart';

class StudentsEducationFormModel extends StudentsEducationFormEntity {
  StudentsEducationFormModel({
    required super.ownership,
    required super.daytimeCount,
    required super.eveningCount,
    required super.externalCount,
    required super.specialExternalCount,
    required super.secondExternalCount,
    required super.remoteCount,
    required super.jointCount,
    required super.secondDaytimeCount,
    required super.secondEveningCount,
  });


  factory StudentsEducationFormModel.fromJson(Map<String, dynamic> json) =>
      StudentsEducationFormModel(
        ownership: json['ownership'],
        daytimeCount: json['daytimeCount'],
        eveningCount: json['eveningCount'],
        externalCount: json['externalCount'],
        specialExternalCount: json['specialExternalCount'],
        secondExternalCount: json['secondExternalCount'],
        remoteCount: json['remoteCount'],
        jointCount: json['jointCount'],
        secondDaytimeCount: json['secondDaytimeCount'],
        secondEveningCount: json['secondEveningCount'],
      );
}

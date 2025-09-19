
abstract class StudentsEducationFormEntity {
  String ownership;
  int daytimeCount;
  int eveningCount;
  int externalCount;
  int specialExternalCount;
  int secondExternalCount;
  int remoteCount;
  int jointCount;
  int secondDaytimeCount;
  int secondEveningCount;

  StudentsEducationFormEntity({
    required this.ownership,
    required this.daytimeCount,
    required this.eveningCount,
    required this.externalCount,
    required this.specialExternalCount,
    required this.secondExternalCount,
    required this.remoteCount,
    required this.jointCount,
    required this.secondDaytimeCount,
    required this.secondEveningCount,
  });
}

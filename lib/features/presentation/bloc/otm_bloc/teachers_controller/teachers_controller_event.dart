
import 'package:stat_edu_mobile/core/constants/constants.dart';

sealed class TeachersControllerEvent {}

final class GetTeacherLeaderDataTeachersControllerEvent extends TeachersControllerEvent {
  final bool update;
  GetTeacherLeaderDataTeachersControllerEvent({required this.update});
}

final class GetProfessorsGenderDataTeachersControllerEvent extends TeachersControllerEvent {
  final bool update;
  GetProfessorsGenderDataTeachersControllerEvent({required this.update});
}

final class GetEducationRankTeachersControllerEvent extends TeachersControllerEvent {
  final bool update;
  GetEducationRankTeachersControllerEvent({required this.update});
}

final class GetPositionDataTeachersControllerEvent extends TeachersControllerEvent {
  final bool update;
  GetPositionDataTeachersControllerEvent({required this.update});
}

final class GetPositionStatisticDataTeachersControllerEvent extends TeachersControllerEvent {
  final bool update;
  GetPositionStatisticDataTeachersControllerEvent({required this.update});
}

final class GetLaborFormStatisticDataTeachersControllerEvent extends TeachersControllerEvent {
  final bool update;
  GetLaborFormStatisticDataTeachersControllerEvent({required this.update});
}

final class GetCitizenStatisticDataTeachersControllerEvent extends TeachersControllerEvent {
  final bool update;
  GetCitizenStatisticDataTeachersControllerEvent({required this.update});
}

final class GetStatisticAgeDataTeachersControllerEvent extends TeachersControllerEvent {
  final bool update;
  GetStatisticAgeDataTeachersControllerEvent({required this.update});
}

final class GetTeacherGenderDataTeachersControllerEvent extends TeachersControllerEvent{
  bool update;
  GetTeacherGenderDataTeachersControllerEvent({required this.update});
}

final class UpdateStateTeachersControllerEvent extends TeachersControllerEvent{}
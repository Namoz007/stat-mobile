part of 'students_controller_bloc.dart';

sealed class StudentsControllerEvent {}

final class GetStudentsByGenderStudentsControllerEvent extends StudentsControllerEvent {
  bool update;

  GetStudentsByGenderStudentsControllerEvent({required this.update});
}

final class ChangeStatisticGenderStudentsControllerEvent
    extends StudentsControllerEvent {
  OtmCategoryType newCategory;

  ChangeStatisticGenderStudentsControllerEvent({required this.newCategory});
}

final class GetEducationCountStudentsControllerEvent
    extends StudentsControllerEvent {
  bool update;

  GetEducationCountStudentsControllerEvent({required this.update});
}

final class ChangeEducationCountStudentsControllerEvent
    extends StudentsControllerEvent {
  OtmCategoryType newCategory;

  ChangeEducationCountStudentsControllerEvent({required this.newCategory});
}

final class GetOTMCourseStudentsControllerEvent
    extends StudentsControllerEvent {
  bool update;

  GetOTMCourseStudentsControllerEvent({required this.update});
}

final class ChangeOTMCourseStudentsControllerEvent
    extends StudentsControllerEvent {
  OtmCategoryType categoryType;

  ChangeOTMCourseStudentsControllerEvent({required this.categoryType});
}

final class GetOTMStudentsPaymentTypeStudentsControllerEvent
    extends StudentsControllerEvent {
  bool update;

  GetOTMStudentsPaymentTypeStudentsControllerEvent({required this.update});
}

final class ChangeOTMStudentsPaymentTypeStudentsControllerEvent
    extends StudentsControllerEvent {
  OtmCategoryType newCategory;

  ChangeOTMStudentsPaymentTypeStudentsControllerEvent({
    required this.newCategory,
  });
}

final class GetStudentsEducationFormStudentsControllerEvent
    extends StudentsControllerEvent {
  bool update;

  GetStudentsEducationFormStudentsControllerEvent({required this.update});
}

final class ChangeStudentsEducationFormStudentsControllerEvent
    extends StudentsControllerEvent {
  OtmCategoryType newCategory;

  ChangeStudentsEducationFormStudentsControllerEvent({
    required this.newCategory,
  });
}

final class GetManyBestStudentsControllerEvent
    extends StudentsControllerEvent {}

final class GetStatisticAgeDataStudentsControllerEvent
    extends StudentsControllerEvent {
  bool update;

  GetStatisticAgeDataStudentsControllerEvent({required this.update});
}

final class GetStudentsPaymentTypeStudentsControllerEvent
    extends StudentsControllerEvent {
  bool update;
  GetStudentsPaymentTypeStudentsControllerEvent({required this.update});
}

final class GetStudentsCoursesStatisticStudentsControllerEvent
    extends StudentsControllerEvent {
  bool update;

  GetStudentsCoursesStatisticStudentsControllerEvent({required this.update,});
}

final class GetStudentsCitizenshipStudentsControllerEvent
    extends StudentsControllerEvent {
  bool update;

  GetStudentsCitizenshipStudentsControllerEvent({required this.update});
}

final class GetStudentsOtmEducationFormStudentsControllerEvent extends StudentsControllerEvent{
  bool update;

  GetStudentsOtmEducationFormStudentsControllerEvent({required this.update});
}

final class GetEducationTypeStatisticStudentsControllerEvent extends StudentsControllerEvent{}



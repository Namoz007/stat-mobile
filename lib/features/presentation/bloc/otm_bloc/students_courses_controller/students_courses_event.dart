part of 'students_courses_bloc.dart';
sealed class StudentsCourseEvent {}

final class GetGenderStudentsCourseEvent extends StudentsCourseEvent {}

final class GetAgeStudentsCourseEvent extends StudentsCourseEvent {}

final class GetResidenceStudentsCourseEvent extends StudentsCourseEvent {}

final class UpdateStateStudentsCourseEvent extends StudentsCourseEvent{}
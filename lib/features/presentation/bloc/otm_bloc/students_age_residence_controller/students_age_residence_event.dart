part of 'students_age_residence_bloc.dart';

sealed class StudentsAgeResidenceEvent {}

final class GetGenderStudentsAgeResidenceEvent extends StudentsAgeResidenceEvent {}

final class GetResidenceStudentsAgeResidenceEvent extends StudentsAgeResidenceEvent {}

final class GetGenderForResidenceStudentsAgeResidenceEvent extends StudentsAgeResidenceEvent {}

final class UpdateStateStudentsAgeResidenceEvent extends StudentsAgeResidenceEvent{}

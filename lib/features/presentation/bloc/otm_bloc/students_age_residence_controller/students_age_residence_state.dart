part of 'students_age_residence_bloc.dart';

class StudentsAgeResidenceState {
  bool loading;
  List<StudentCourseEntity> studentsGenderData;
  List<StudentCourseEntity> studentsResidenceData;
  List<StudentCourseEntity> studentsGenderForResidence;

  StudentsAgeResidenceState({
    required this.loading,
    required this.studentsGenderData,
    required this.studentsResidenceData,
    required this.studentsGenderForResidence,
  });

  StudentsAgeResidenceState copyWith({
    bool? isLoading,
    List<StudentCourseEntity>? newStudentsGenderData,
    List<StudentCourseEntity>? newStudentsResidence,
    List<StudentCourseEntity>? newStudentsGenderForResidence,
  }) {
    return StudentsAgeResidenceState(
      loading: isLoading ?? loading,
      studentsGenderData: newStudentsGenderData ?? studentsGenderData,
      studentsResidenceData: newStudentsResidence ?? studentsResidenceData,
      studentsGenderForResidence:
          newStudentsGenderForResidence ?? studentsGenderForResidence,
    );
  }

  factory StudentsAgeResidenceState.initialState() => StudentsAgeResidenceState(
    loading: false,
    studentsGenderData: [],
    studentsResidenceData: [],
    studentsGenderForResidence: [],
  );
}

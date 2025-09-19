part of 'students_courses_bloc.dart';

class StudentsCoursesState {
  bool loading;
  List<StudentCourseEntity> studentsByGender;
  List<StudentCourseEntity> studentsByAge;
  List<StudentCourseEntity> studentsByResidence;

  StudentsCoursesState({
    required this.loading,
    required this.studentsByGender,
    required this.studentsByAge,
    required this.studentsByResidence,
  });

  StudentsCoursesState copyWith({
    bool? isLoading,
    List<StudentCourseEntity>? newStudentsGenderData,
    List<StudentCourseEntity>? newStudentsAgeData,
    List<StudentCourseEntity>? newStudentsResidenceData,
  }) {
    return StudentsCoursesState(
      loading: isLoading ?? loading,
      studentsByGender: newStudentsGenderData ?? studentsByGender,
      studentsByAge: newStudentsAgeData ?? studentsByAge,
      studentsByResidence: newStudentsResidenceData ?? studentsByResidence,
    );
  }

  factory StudentsCoursesState.initialState() => StudentsCoursesState(
    loading: false,
    studentsByGender: [],
    studentsByAge: [],
    studentsByResidence: [],
  );
}

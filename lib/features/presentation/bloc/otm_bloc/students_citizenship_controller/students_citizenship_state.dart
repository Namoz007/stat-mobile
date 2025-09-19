part of 'students_citizenship_bloc.dart';

class StudentsCitizenshipState {
  bool loading;
  List<StudentCourseEntity> studentsGenderData;
  List<StudentCourseEntity> studentsAgeData;
  List<StudentCourseEntity> studentsCoursesData;

  StudentsCitizenshipState({
    required this.loading,
    required this.studentsGenderData,
    required this.studentsAgeData,
    required this.studentsCoursesData,
  });

  StudentsCitizenshipState copyWith({
    bool? isLoading,
    List<StudentCourseEntity>? newStudentsGenderData,
    List<StudentCourseEntity>? newStudentsAgeData,
    List<StudentCourseEntity>? newStudentsCoursesData,
  }) => StudentsCitizenshipState(
    loading: isLoading ?? loading,
    studentsGenderData: newStudentsGenderData ?? studentsGenderData,
    studentsAgeData: newStudentsAgeData ?? studentsAgeData,
    studentsCoursesData: newStudentsCoursesData ?? studentsCoursesData,
  );

  factory StudentsCitizenshipState.initialState() => StudentsCitizenshipState(
    loading: false,
    studentsGenderData: [],
    studentsCoursesData: [],
    studentsAgeData: [],
  );
}

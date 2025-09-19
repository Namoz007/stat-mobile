part of 'students_payment_form_bloc.dart';

class StudentsPaymentFormState {
  bool loading;
  List<StudentCourseEntity> studentsByGenderData;
  List<StudentCourseEntity> studentsAgeData;
  List<StudentCourseEntity> studentsCitizenshipData;
  List<StudentCourseEntity> studentsCoursesData;
  List<StudentCourseEntity> studentsResidence;

  StudentsPaymentFormState({
    required this.loading,
    required this.studentsByGenderData,
    required this.studentsAgeData,
    required this.studentsCitizenshipData,
    required this.studentsCoursesData,
    required this.studentsResidence,
  });

  StudentsPaymentFormState copyWith({
    bool? isLoading,
    List<StudentCourseEntity>? newStudentsByGenderData,
    List<StudentCourseEntity>? newStudentsByAgeData,
    List<StudentCourseEntity>? newStudentsCitizenshipData,
    List<StudentCourseEntity>? newStudentsCoursesData,
    List<StudentCourseEntity>? newStudentsResidenceData,
  }) {
    return StudentsPaymentFormState(
      loading: isLoading ?? loading,
      studentsByGenderData: newStudentsByGenderData ?? studentsByGenderData,
      studentsAgeData: newStudentsByAgeData ?? studentsAgeData,
      studentsCitizenshipData: newStudentsCitizenshipData ?? studentsCitizenshipData,
      studentsCoursesData: newStudentsCoursesData ?? studentsCoursesData,
      studentsResidence: newStudentsResidenceData ?? studentsResidence,
    );
  }

  factory StudentsPaymentFormState.initialState() => StudentsPaymentFormState(
    loading: false,
    studentsByGenderData: [],
    studentsAgeData: [],
    studentsCitizenshipData: [],
    studentsCoursesData: [],
    studentsResidence: [],
  );
}

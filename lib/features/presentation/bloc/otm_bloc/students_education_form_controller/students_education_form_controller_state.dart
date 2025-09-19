part of 'students_education_form_controller_bloc.dart';

class StudentsEducationFormControllerState {
  bool loading;
  List<StudentCourseEntity> studentsAgeByEducationForm;
  List<StudentCourseEntity> studentsCitizenshipData;
  List<StudentCourseEntity> studentsEducationPaymentType;
  List<StudentCourseEntity> studentsEducationCourses;
  List<StudentCourseEntity> studentsResidenceData;
  List<StudentCourseEntity> studentsGenderData;

  StudentsEducationFormControllerState({
    required this.loading,
    required this.studentsAgeByEducationForm,
    required this.studentsCitizenshipData,
    required this.studentsEducationPaymentType,
    required this.studentsEducationCourses,
    required this.studentsResidenceData,
    required this.studentsGenderData,
  });

  StudentsEducationFormControllerState copyWith({
    bool? isLoading,
    List<StudentCourseEntity>? newStudentsAgeEducationFormData,
    List<StudentCourseEntity>? newStudentsCitizenshipData,
    List<StudentCourseEntity>? newStudentsEducationPaymentType,
    List<StudentCourseEntity>? newStudentsEducationCourse,
    List<StudentCourseEntity>? newStudentsResidenceData,
    List<StudentCourseEntity>? newStudentsGenderData,
  }) {
    return StudentsEducationFormControllerState(
      loading: isLoading ?? loading,
      studentsAgeByEducationForm:
          newStudentsAgeEducationFormData ?? studentsAgeByEducationForm,
      studentsCitizenshipData:
          newStudentsCitizenshipData ?? studentsCitizenshipData,
      studentsEducationPaymentType:
          newStudentsEducationPaymentType ?? studentsEducationPaymentType,
      studentsEducationCourses:
          newStudentsEducationCourse ?? studentsEducationCourses,
      studentsResidenceData: newStudentsResidenceData ?? studentsResidenceData,
      studentsGenderData: newStudentsGenderData ?? studentsGenderData,
    );
  }

  factory StudentsEducationFormControllerState.initialState() =>
      StudentsEducationFormControllerState(
        loading: false,
        studentsAgeByEducationForm: [],
        studentsCitizenshipData: [],
        studentsEducationPaymentType: [],
        studentsEducationCourses: [],
        studentsResidenceData: [],
        studentsGenderData: []
      );
}

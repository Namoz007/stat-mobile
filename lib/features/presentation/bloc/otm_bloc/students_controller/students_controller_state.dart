part of 'students_controller_bloc.dart';

class StudentsControllerState {
  bool loading;
  List<OtmGenderEntity> studentsStatisticGender;
  List<OtmEducationTypeEntity> studentsStatisticEducation;
  List<StudentOtmCourseEntity> studentsOTMCourses;
  List<StudentsEducationFormEntity> studentsEducationForm;
  List<OTMAreaEntity> manyBestStudentsArea;
  List<StudentByAgeStatisticEntity> studentsPaymentTypeStatisticData;
  List<StudentByAgeStatisticEntity> studentsCoursesStatisticData;
  List<StudentByAgeStatisticEntity> studentsCitizenshipStatisticData;
  List<StudentByAgeStatisticEntity> studentsOtmEducationFormData;
  List<StudentCourseEntity> studentsEducationTypeStatisticData;
  List<StudentPaymentDataEntity> studentsPaymentForm;
  List<StudentByAgeStatisticEntity> studentsByAgeStatisticData;

  StudentsControllerState({
    required this.loading,
    required this.studentsStatisticGender,
    required this.studentsStatisticEducation,
    required this.studentsOTMCourses,
    required this.studentsEducationForm,
    required this.manyBestStudentsArea,
    required this.studentsByAgeStatisticData,
    required this.studentsPaymentTypeStatisticData,
    required this.studentsCoursesStatisticData,
    required this.studentsCitizenshipStatisticData,
    required this.studentsOtmEducationFormData,
    required this.studentsEducationTypeStatisticData,
    required this.studentsPaymentForm,
  });

  StudentsControllerState copyWith({
    bool? isLoading,
    List<OtmGenderEntity>? newStudentsWithGender,
    List<OtmEducationTypeEntity>? newStudentsWithEducation,
    List<StudentOtmCourseEntity>? newStudentsOTMCourses,
    List<StudentsEducationFormEntity>? newStudentsEducationForm,
    List<OTMAreaEntity>? newManyBestStudentsArea,
    List<StudentByAgeStatisticEntity>? newAgeStatisticData,
    List<StudentByAgeStatisticEntity>? newStudentsPaymentType,
    List<StudentByAgeStatisticEntity>? newStudentsCoursesData,
    List<StudentByAgeStatisticEntity>? newStudentsCitizenshipData,
    List<StudentByAgeStatisticEntity>? newStudentsOtmEducationFormData,
    List<StudentCourseEntity>? newStudentsEducationTypeStatisticData,
    List<StudentPaymentDataEntity>? newStudentsPaymentForm,
  }) {
    return StudentsControllerState(
      loading: isLoading ?? loading,
      studentsStatisticGender: newStudentsWithGender ?? studentsStatisticGender,
      studentsStatisticEducation:
          newStudentsWithEducation ?? studentsStatisticEducation,
      studentsOTMCourses: newStudentsOTMCourses ?? studentsOTMCourses,
      studentsEducationForm: newStudentsEducationForm ?? studentsEducationForm,
      manyBestStudentsArea: newManyBestStudentsArea ?? manyBestStudentsArea,
      studentsByAgeStatisticData:
          newAgeStatisticData ?? studentsByAgeStatisticData,
      studentsPaymentTypeStatisticData:
          newStudentsPaymentType ?? studentsPaymentTypeStatisticData,
      studentsCoursesStatisticData:
          newStudentsCoursesData ?? studentsCoursesStatisticData,
      studentsCitizenshipStatisticData:
          newStudentsCitizenshipData ?? studentsCitizenshipStatisticData,
      studentsOtmEducationFormData:
          newStudentsOtmEducationFormData ?? studentsOtmEducationFormData,
      studentsEducationTypeStatisticData: newStudentsEducationTypeStatisticData ?? studentsEducationTypeStatisticData,
      studentsPaymentForm: newStudentsPaymentForm ?? studentsPaymentForm,
    );
  }

  factory StudentsControllerState.empty() => StudentsControllerState(
    loading: false,
    studentsStatisticGender: [],
    studentsStatisticEducation: [],
    studentsOTMCourses: [],
    studentsEducationForm: [],
    manyBestStudentsArea: [],
    studentsByAgeStatisticData: [],
    studentsPaymentTypeStatisticData: [],
    studentsCoursesStatisticData: [],
    studentsCitizenshipStatisticData: [],
    studentsOtmEducationFormData: [],
    studentsEducationTypeStatisticData: [],
    studentsPaymentForm: [],
  );
}

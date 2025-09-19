part of 'students_region_section_bloc.dart';

class StudentsRegionSectionState {
  bool loading;
  List<RegionDataEntity> studentsGenderData;
  List<RegionDataEntity> studentsEducationTypeData;
  List<RegionDataEntity> studentsAgeData;
  List<RegionDataEntity> studentsPaymentFormData;
  List<RegionDataEntity> studentsCoursesData;
  List<RegionDataEntity> studentsCitizenshipData;
  List<RegionDataEntity> studentsResidenceData;
  List<RegionDataEntity> studentsEducationForm;

  StudentsRegionSectionState({
    required this.loading,
    required this.studentsGenderData,
    required this.studentsEducationTypeData,
    required this.studentsAgeData,
    required this.studentsPaymentFormData,
    required this.studentsCoursesData,
    required this.studentsCitizenshipData,
    required this.studentsResidenceData,
    required this.studentsEducationForm,
  });

  StudentsRegionSectionState copyWith({
    bool? isLoading,
    List<RegionDataEntity>? newStudentsGenderData,
    List<RegionDataEntity>? newStudentsEducationType,
    List<RegionDataEntity>? newStudentsAgeData,
    List<RegionDataEntity>? newStudentsPaymentFormData,
    List<RegionDataEntity>? newStudentsCoursesData,
    List<RegionDataEntity>? newStudentsCitizenshipData,
    List<RegionDataEntity>? newStudentsResidenceData,
    List<RegionDataEntity>? newStudentsEducationFormData,
  }) {
    return StudentsRegionSectionState(
      loading: isLoading ?? loading,
      studentsGenderData: newStudentsGenderData ?? studentsGenderData,
      studentsEducationTypeData:
          newStudentsEducationType ?? studentsEducationTypeData,
      studentsAgeData: newStudentsAgeData ?? studentsAgeData,
      studentsPaymentFormData:
          newStudentsPaymentFormData ?? studentsPaymentFormData,
      studentsCoursesData: newStudentsCoursesData ?? studentsCoursesData,
      studentsCitizenshipData:
          newStudentsCitizenshipData ?? studentsCitizenshipData,
      studentsResidenceData: newStudentsResidenceData ?? studentsResidenceData,
      studentsEducationForm:
          newStudentsEducationFormData ?? studentsEducationForm,
    );
  }

  factory StudentsRegionSectionState.initialState() =>
      StudentsRegionSectionState(
        loading: false,
        studentsGenderData: [],
        studentsEducationTypeData: [],
        studentsAgeData: [],
        studentsPaymentFormData: [],
        studentsCoursesData: [],
        studentsCitizenshipData: [],
        studentsResidenceData: [],
        studentsEducationForm: [],
      );
}

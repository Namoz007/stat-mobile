part of 'professional_education_bloc.dart';

@immutable
class ProfessionalEducationState {
  bool loading;
  ProfessionalEducationTypeResponseEntity educationTypeData;
  List<ProfessionalInstitutionEntity> institutionData;
  ProfessionalEducationFormResponseEntity educationFormData;
  ProfessionalPaymentFormResponseEntity paymentFormData;
  ProfessionalCoursesResponseEntity coursesData;
  ProfessionalCitizenshipResponseEntity citizenshipResponseData;
  ProfessionalAgeResponseEntity ageResponseData;
  ProfessionalResidenceAreaResponseEntity residenceAreaResponseData;
  ProfessionalAreasSectionResponseEntity areasSectionResponseData;

  ProfessionalEducationState({
    required this.loading,
    required this.educationTypeData,
    required this.institutionData,
    required this.educationFormData,
    required this.paymentFormData,
    required this.coursesData,
    required this.citizenshipResponseData,
    required this.ageResponseData,
    required this.residenceAreaResponseData,
    required this.areasSectionResponseData,
  });

  ProfessionalEducationState copyWith({
    bool? isLoading,
    ProfessionalEducationTypeResponseEntity? newEducationTypeData,
    List<ProfessionalInstitutionEntity>? newInstitutionData,
    ProfessionalEducationFormResponseEntity? newEducationFormResponse,
    ProfessionalPaymentFormResponseEntity? newPaymentFormData,
    ProfessionalCoursesResponseEntity? newCoursesData,
    ProfessionalCitizenshipResponseEntity? newCitizenshipData,
    ProfessionalAgeResponseEntity? newAgeData,
    ProfessionalResidenceAreaResponseEntity? newResidenceAreaData,
    ProfessionalAreasSectionResponseEntity? newAreasSectionData,
  }) => ProfessionalEducationState(
    loading: isLoading ?? loading,
    educationTypeData: newEducationTypeData ?? educationTypeData,
    institutionData: newInstitutionData ?? institutionData,
    educationFormData: newEducationFormResponse ?? educationFormData,
    paymentFormData: newPaymentFormData ?? paymentFormData,
    coursesData: newCoursesData ?? coursesData,
    citizenshipResponseData: newCitizenshipData ?? citizenshipResponseData,
    ageResponseData: newAgeData ?? ageResponseData,
    residenceAreaResponseData: newResidenceAreaData ?? residenceAreaResponseData,
    areasSectionResponseData: newAreasSectionData ?? areasSectionResponseData,
  );

  factory ProfessionalEducationState.initialState() =>
      ProfessionalEducationState(
        loading: false,
        educationTypeData: ProfessionalEducationTypeResponseModel.empty(),
        institutionData: [],
        educationFormData: ProfessionalEducationFormResponseModel.empty(),
        paymentFormData: ProfessionalPaymentFormResponseModel.empty(),
        coursesData: ProfessionalCoursesResponseModel.empty(),
        citizenshipResponseData: ProfessionalCitizenshipResponseModel.empty(),
        ageResponseData: ProfessionalAgeResponseModel.empty(),
        residenceAreaResponseData: ProfessionalResidenceAreaResponseModel.empty(),
        areasSectionResponseData: ProfessionalAreasSectionResponseModel.empty(),
      );
}

import 'package:stat_edu_mobile/sources.dart';

class OtmControllerState {
  bool loading;
  List<UniversityEntity> universities;
  List<OtmGenderEntity> professorsGenderData;
  List<OtmUniversityTypeEntity> otmOrganizationalTypeData;
  List<StudentCourseEntity> studentsCountData;
  List<OTMAreaEntity> otmDataWithAddress;
  List<TopUniversityEntity> topFiveUniversityData;

  OtmControllerState({
    required this.loading,
    required this.universities,
    required this.professorsGenderData,
    required this.studentsCountData,
    required this.otmOrganizationalTypeData,
    required this.otmDataWithAddress,
    required this.topFiveUniversityData,
  });

  OtmControllerState copyWith({
    bool? isLoading,
    List<UniversityEntity>? newUniversities,
    List<OtmGenderEntity>? newProfessorsGender,
    List<OtmUniversityTypeEntity>? newOtmOrganizationalTypeData,
    List<StudentCourseEntity>? newStudentsCountData,
    List<OTMAreaEntity>? newOtmDataWithAddress,
    List<TopUniversityEntity>? newTopFiveUniversityData
  }) {
    return OtmControllerState(
      loading: isLoading ?? loading,
      universities: newUniversities ?? universities,
      professorsGenderData: newProfessorsGender ?? professorsGenderData,
      otmOrganizationalTypeData: newOtmOrganizationalTypeData ?? otmOrganizationalTypeData,
      studentsCountData: newStudentsCountData ?? studentsCountData,
      otmDataWithAddress: newOtmDataWithAddress ?? otmDataWithAddress,
      topFiveUniversityData: newTopFiveUniversityData ?? topFiveUniversityData,
    );
  }

  factory OtmControllerState.empty() => OtmControllerState(
    loading: false,
    universities: [],
    professorsGenderData: [],
    studentsCountData: [],
    otmOrganizationalTypeData: [],
    otmDataWithAddress: [],
    topFiveUniversityData: [],
  );
}

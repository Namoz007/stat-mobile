part of 'doctoral_studies_controller_bloc.dart';

class DoctoralStudiesControllerState {
  bool loading;
  List<DoctoralStudiesOrganizationEntity> organizationsData;
  List<DoctoralStudiesProvinceEducationOrganizationsEntity>
  provinceOTMAndOrganizationsData;
  List<DoctoralStudiesProvinceDoctoralEntity> provinceDoctoralAndLeadersData;
  List<DoctoralStudiesDirectionDoctoralEntity> directionsData;

  DoctoralStudiesControllerState({
    required this.loading,
    required this.organizationsData,
    required this.provinceOTMAndOrganizationsData,
    required this.provinceDoctoralAndLeadersData,
    required this.directionsData,
  });

  DoctoralStudiesControllerState copyWith({
    bool? isLoading,
    List<DoctoralStudiesOrganizationEntity>? newOrganizationsData,
    List<DoctoralStudiesProvinceEducationOrganizationsEntity>?
    newOTMAndOrganizations,
    List<DoctoralStudiesProvinceDoctoralEntity>? newDoctoralAndLeadersData,
    List<DoctoralStudiesDirectionDoctoralEntity>? newDirectionsData,
  }) => DoctoralStudiesControllerState(
    loading: isLoading ?? loading,
    organizationsData: newOrganizationsData ?? organizationsData,
    provinceOTMAndOrganizationsData:
        newOTMAndOrganizations ?? provinceOTMAndOrganizationsData,
    provinceDoctoralAndLeadersData:
        newDoctoralAndLeadersData ?? provinceDoctoralAndLeadersData,
    directionsData: newDirectionsData ?? directionsData,
  );

  factory DoctoralStudiesControllerState.initialState() =>
      DoctoralStudiesControllerState(
        loading: false,
        organizationsData: [],
        provinceOTMAndOrganizationsData: [],
        provinceDoctoralAndLeadersData: [],
        directionsData: [],
      );
}

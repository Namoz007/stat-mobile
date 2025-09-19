part of 'otm_data_controller_cubit.dart';

@immutable
class OTMDataControllerState {
  List<UniversityEntity> otmData;
  List<UniversityEntity>? searchUniversities;
  OtmCategoryType ownershipCategory;
  String searchName;

  OTMDataControllerState({
    required this.otmData,
    this.searchUniversities,
    required this.ownershipCategory,
    required this.searchName,
  });

  OTMDataControllerState copyWith({
    List<UniversityEntity>? newOtmData,
    List<UniversityEntity>? newSearchUniversities,
    OtmCategoryType? newOwnershipCategory,
    String? searchByName,
  }) {
    return OTMDataControllerState(
      otmData: newOtmData ?? otmData,
      searchUniversities: newSearchUniversities,
      ownershipCategory: newOwnershipCategory ?? ownershipCategory,
      searchName: searchByName ?? searchName,
    );
  }

  factory OTMDataControllerState.initial() => OTMDataControllerState(
    otmData: [],
    ownershipCategory: OtmCategoryType.general,
    searchName: ''
  );
}

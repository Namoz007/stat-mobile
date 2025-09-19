import 'package:stat_edu_mobile/sources.dart';

class ProfessionalInstitutionControllerState {
  bool loading;
  List<ProfessionalInstitutionEntity> institutions;
  List<ProfessionalInstitutionEntity>? searchInstitutions;
  ProfessionalOwnershipCategory ownershipCategory;
  OTMEducationTypeCategory educationTypeCategory;

  ProfessionalInstitutionControllerState({
    required this.loading,
    required this.institutions,
    required this.searchInstitutions,
    required this.ownershipCategory,
    required this.educationTypeCategory,
  });

  ProfessionalInstitutionControllerState copyWith({
    bool? isLoading,
    List<ProfessionalInstitutionEntity>? newInstitutions,
    List<ProfessionalInstitutionEntity>? newSearchInstitutions,
    ProfessionalOwnershipCategory? newOwnershipCategory,
    OTMEducationTypeCategory? newEducationTypeCategory,
  }) => ProfessionalInstitutionControllerState(
    loading: isLoading ?? loading,
    institutions: newInstitutions ?? institutions,
    searchInstitutions: newSearchInstitutions,
    ownershipCategory: newOwnershipCategory ?? ownershipCategory,
    educationTypeCategory: newEducationTypeCategory ?? educationTypeCategory,
  );

  factory ProfessionalInstitutionControllerState.initialState() =>
      ProfessionalInstitutionControllerState(
        loading: false,
        institutions: [],
        searchInstitutions: null,
        ownershipCategory: ProfessionalOwnershipCategory.none,
        educationTypeCategory: OTMEducationTypeCategory.none,
      );
}

import 'package:stat_edu_mobile/sources.dart';

class ProfessionalInstitutionControllerCubit extends Cubit<ProfessionalInstitutionControllerState>{
  ProfessionalInstitutionControllerCubit() : super(ProfessionalInstitutionControllerState.initialState());

  final _repository = getIt<ProfessionalControllerRepositoryImpl>();

  void getInstitutions(bool update) async{
    if(state.institutions.isEmpty || update){
      emit(state.copyWith(isLoading: true));
      await _repository.getProfessionalInstitutionData().then((value) => value.fold((l) => emit(state.copyWith(isLoading: false)), (r) => emit(state.copyWith(isLoading: false,newInstitutions: r,newOwnershipCategory: ProfessionalOwnershipCategory.none,newEducationTypeCategory: OTMEducationTypeCategory.none))));
    }
  }

  void searchInstitutionsWithName(String? name){
    if(name != null){
      emit(state.copyWith(newSearchInstitutions: state.institutions.where((value) => value.name_uz.toLowerCase().contains(name.toLowerCase())).toList()));
      _sortDataByCategoryAndSearch();
    }else{
      emit(state.copyWith(newSearchInstitutions: null));
    }
  }

  void newEducationCategory(OTMEducationTypeCategory newCategory){
    emit(state.copyWith(newEducationTypeCategory: newCategory));
    _sortDataByCategoryAndSearch();
  }

  void newOwnershipCategory(ProfessionalOwnershipCategory newCategory){
    emit(state.copyWith(newOwnershipCategory: newCategory));
    _sortDataByCategoryAndSearch();
  }

  void _sortDataByCategoryAndSearch(){
    if(state.ownershipCategory != ProfessionalOwnershipCategory.none){
      if(state.searchInstitutions == null){
        emit(state.copyWith(newSearchInstitutions: state.institutions.where((value) => value.ownership_form == getInstitutionsOwnershipCategory(state.ownershipCategory)).toList()));
      }else{
        emit(state.copyWith(newSearchInstitutions: state.searchInstitutions?.where((value) => value.ownership_form == getInstitutionsOwnershipCategory(state.ownershipCategory)).toList()));
      }
    }

    if(state.educationTypeCategory != OTMEducationTypeCategory.none){
      if(state.searchInstitutions == null){
        emit(state.copyWith(newSearchInstitutions: state.institutions.where((value) => value.education_type == getProfessionalEducationTypeCategory(state.educationTypeCategory)).toList()));
      }else{
        emit(state.copyWith(newSearchInstitutions: state.searchInstitutions!.where((value) => value.education_type == getProfessionalEducationTypeCategory(state.educationTypeCategory)).toList()));
      }
    }
  }

}
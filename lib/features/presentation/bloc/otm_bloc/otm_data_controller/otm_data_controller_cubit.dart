import 'package:stat_edu_mobile/sources.dart';
part 'otm_data_controller_state.dart';

class OtmDataControllerCubit extends Cubit<OTMDataControllerState> {
  OtmDataControllerCubit() : super(OTMDataControllerState.initial());

  void searchOTMWithName(String? name){
    state.searchName = name ?? '';
    emit(state.copyWith(newSearchUniversities:  _searchUniversitiesByName()));
  }

  void clearSearch(){
    state.searchName = '';
    emit(state.copyWith(newSearchUniversities: _searchUniversitiesByName(),));
  }

  void addOTMData(List<UniversityEntity> universities){
    emit(state.copyWith(newOtmData: universities));
  }


  void changeOwnershipCategory(OtmCategoryType newCategory){
    state.ownershipCategory = newCategory;
    emit(state.copyWith(newSearchUniversities: _searchUniversitiesByName()));
  }


  List<UniversityEntity> _searchUniversitiesByName(){
    if(state.searchName.isNotEmpty){
      if(state.ownershipCategory != OtmCategoryType.general){
        return state.otmData.where((value) => value.nameEn.toString().toLowerCase().contains(state.searchName.toLowerCase()) || value.nameRu.toLowerCase().contains(state.searchName.toLowerCase()) || value.nameUz.toLowerCase().contains(state.searchName.toLowerCase())).toList().where((value) => value.categoryType == state.ownershipCategory).toList();
      }else{
        return state.otmData.where((value) => value.nameEn.toString().toLowerCase().contains(state.searchName.toLowerCase()) || value.nameRu.toLowerCase().contains(state.searchName.toLowerCase()) || value.nameUz.toLowerCase().contains(state.searchName.toLowerCase())).toList();
      }
    }else{
      if(state.ownershipCategory != OtmCategoryType.general){
        return state.otmData.where((value) => value.categoryType == state.ownershipCategory).toList();
      }else{
        return state.otmData;
      }
    }
  }
}

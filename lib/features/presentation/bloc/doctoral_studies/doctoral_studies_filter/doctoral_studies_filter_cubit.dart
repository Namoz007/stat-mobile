import 'package:dartz/dartz.dart';
import 'package:stat_edu_mobile/sources.dart';
part 'doctoral_studies_filter_state.dart';

class DoctoralStudiesFilterCubit extends Cubit<DoctoralStudiesFilterState>{
  DoctoralStudiesFilterCubit() : super(DoctoralStudiesFilterState.initialState());

  void updateCategory(DoctoralStudiesFilter newCategory) {
    emit(state.copyWith(newCategory: newCategory,isShowCategory: false));
  }

  void showCategory(){
    emit(state.copyWith(isShowCategory: !state.showCategory));
  }

}
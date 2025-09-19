import 'package:stat_edu_mobile/sources.dart';

class StudentsFilterCubit extends Cubit<StudentsFilterState>{
  StudentsFilterCubit() : super(StudentsFilterState.initialState());

  void newFilterCategory(StudentsFilterCategory newCategory){
    emit(state.copyWith(newCategory: newCategory,show: false));
  }

  void showCategory(){
    emit(state.copyWith(show: state.showCategory ? false : true));
  }
}
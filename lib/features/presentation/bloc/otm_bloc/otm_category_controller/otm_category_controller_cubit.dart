import 'package:stat_edu_mobile/sources.dart';
part 'otm_category_controller_state.dart';

class OtmCategoryControllerCubit extends Cubit<OtmCategoryControllerState> {
  OtmCategoryControllerCubit() : super(OtmCategoryControllerState.initialState());

  void newCategories(List<String> newCategories) => emit(state.copyWith(newCategories: newCategories));

  void newIndex({required int index,bool? updateController}){
    if(updateController != null && updateController){
      state.controller.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
    emit(state.copyWith(newIndex: index));
  }

  void newPages(List<Widget> newPages) => emit(state.copyWith(newPages: newPages));

}

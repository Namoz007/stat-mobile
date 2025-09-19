import 'package:stat_edu_mobile/sources.dart';
part 'otm_title_category_controller_state.dart';

class OtmTitleCategoryControllerCubit extends Cubit<OtmTitleCategoryControllerState> {
  OtmTitleCategoryControllerCubit() : super(OtmTitleCategoryControllerState.initialState());

  void newCategory(int index) async{
    await state.controller.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.linear);
    emit(state.copyWith(newIndex: index,newController: state.controller));
  }
}

import 'package:stat_edu_mobile/sources.dart';

part 'acceptance_filter_category_state.dart';

class AcceptanceFilterCategoryCubit extends Cubit<AcceptanceFilterCategoryState>{
  AcceptanceFilterCategoryCubit() : super(AcceptanceFilterCategoryState.initialState());

  void updateCategory(AcceptanceFilterCategory newCategory){
    emit(state.copyWith(newCategory: newCategory));
  }

}
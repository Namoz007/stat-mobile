part of 'otm_category_controller_cubit.dart';

@immutable
class OtmCategoryControllerState {
  List<String> categories;
  List<Widget> pages;
  PageController controller;
  int index;

  OtmCategoryControllerState({
    required this.categories,
    required this.pages,
    required this.controller,
    required this.index,
  });

  OtmCategoryControllerState copyWith({
    List<String>? newCategories,
    List<Widget>? newPages,
    PageController? newController,
    int? newIndex,
  }) => OtmCategoryControllerState(
    categories: newCategories ?? categories,
    pages: newPages ?? pages,
    controller: newController ?? controller,
    index: newIndex ?? index,
  );

  factory OtmCategoryControllerState.initialState() =>
      OtmCategoryControllerState(
        categories: [],
        pages: [],
        controller: PageController(),
        index: 0,
      );
}

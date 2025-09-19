part of 'otm_title_category_controller_cubit.dart';

@immutable
class OtmTitleCategoryControllerState {
  PageController controller;
  int index;

  OtmTitleCategoryControllerState({
    required this.controller,
    required this.index,
  });

  OtmTitleCategoryControllerState copyWith({
    PageController? newController,
    int? newIndex,
  }) => OtmTitleCategoryControllerState(
    controller: newController ?? controller,
    index: newIndex ?? index,
  );

  factory OtmTitleCategoryControllerState.initialState() =>
      OtmTitleCategoryControllerState(controller: PageController(), index: 0);
}

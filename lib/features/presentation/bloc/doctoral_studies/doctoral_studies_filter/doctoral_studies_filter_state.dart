part of 'doctoral_studies_filter_cubit.dart';

@immutable
class DoctoralStudiesFilterState {
  DoctoralStudiesFilter currentCategory;
  bool showCategory;

  DoctoralStudiesFilterState({required this.currentCategory,required this.showCategory,});

  DoctoralStudiesFilterState copyWith({DoctoralStudiesFilter? newCategory,bool? isShowCategory}) =>
      DoctoralStudiesFilterState(
        currentCategory: newCategory ?? currentCategory,showCategory: isShowCategory ?? showCategory,
      );

  factory DoctoralStudiesFilterState.initialState() =>
      DoctoralStudiesFilterState(
        currentCategory: DoctoralStudiesFilter.general,
        showCategory: false,
      );
}

part of 'acceptance_filter_category_cubit.dart';

class AcceptanceFilterCategoryState {
  AcceptanceFilterCategory currentCategory;

  AcceptanceFilterCategoryState({required this.currentCategory});

  AcceptanceFilterCategoryState copyWith({
    AcceptanceFilterCategory? newCategory,
  }) => AcceptanceFilterCategoryState(
    currentCategory: newCategory ?? currentCategory,
  );

  factory AcceptanceFilterCategoryState.initialState() => AcceptanceFilterCategoryState(currentCategory: AcceptanceFilterCategory.Acceptancefrom2021to2024);

}

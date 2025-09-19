import 'package:stat_edu_mobile/core/constants/constants.dart';

class StudentsFilterState {
  StudentsFilterCategory category;
  bool showCategory;

  StudentsFilterState({required this.category, required this.showCategory});

  StudentsFilterState copyWith({
    StudentsFilterCategory? newCategory,
    bool? show,
  }) => StudentsFilterState(
    category: newCategory ?? category,
    showCategory: show ?? showCategory,
  );

  factory StudentsFilterState.initialState() => StudentsFilterState(
    category: StudentsFilterCategory.education_type,
    showCategory: false,
  );
}

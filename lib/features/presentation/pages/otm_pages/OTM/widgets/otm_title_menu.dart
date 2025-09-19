import 'package:stat_edu_mobile/sources.dart';

class OtmTitleMenu extends StatelessWidget {
  PageController pageController;

  OtmTitleMenu({super.key, required this.pageController});


  @override
  Widget build(BuildContext context) {
    List<String> titleStrings = [
      AppLocalizations.of(context)!.total,
      AppLocalizations.of(context)!.students,
      AppLocalizations.of(context)!.teachers,
      AppLocalizations.of(context)!.universities,
    ];
    return BlocBuilder<
      OtmTitleCategoryControllerCubit,
      OtmTitleCategoryControllerState
    >(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            color: AppColors.screenAppBarCategoryColor,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(titleStrings.length, (index) {
                return ShowOtmCategory(
                  categoryTitle: titleStrings[index],
                  backgroundColor:
                      state.index == index
                          ? AppColors.decorativeColor
                          : Colors.white,
                  titleColor:
                      state.index == index
                          ? Colors.white
                          : AppColors.decorativeColor,
                  onTap: () {
                    context.read<OtmTitleCategoryControllerCubit>().newCategory(
                      index,
                    );
                  },
                );
              }),
            ),
          ),
        );
      },
    );
  }
}

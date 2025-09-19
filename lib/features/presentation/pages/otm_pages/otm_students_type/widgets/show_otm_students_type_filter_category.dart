import 'package:stat_edu_mobile/sources.dart';

class ShowOtmStudentsTypeFilterCategory extends StatelessWidget {
  const ShowOtmStudentsTypeFilterCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsFilterCubit, StudentsFilterState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getTranslateWord(context: context, value: getFilterNameWithCategory(state.category)),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      GestureDetector(
                        onTap:
                            () =>
                                context
                                    .read<StudentsFilterCubit>()
                                    .showCategory(),
                        child: SvgPicture.asset(AppSvgs.arrowUpIcon),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: List.generate(studentsFilterCategories.length, (
                      index,
                    ) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: InkWell(
                              onTap:
                                  () => context.read<StudentsFilterCubit>().newFilterCategory(studentsFilterCategories[index],),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    getTranslateWord(context: context, value: getFilterNameWithCategory(
                                      studentsFilterCategories[index],
                                    ),),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          AppColors
                                              .acceptanceStatisticNameColor,
                                    ),
                                  ),

                                  state.category ==
                                          studentsFilterCategories[index]
                                      ? Container(
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.greenBarChart,
                                        ),
                                      )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                          index == studentsFilterCategories.length - 1
                              ? const SizedBox()
                              : Divider(color: Colors.black),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),

            //
          ],
        );
      },
    );
  }
}

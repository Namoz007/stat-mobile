import 'package:stat_edu_mobile/sources.dart';

class ProfessionalCoursesAgeData extends StatelessWidget {
  const ProfessionalCoursesAgeData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.coursesData.ageData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.age,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              const SizedBox(height: 12),
              StatisticTitleCount(
                title: [AppLocalizations.of(context)!.under20,AppLocalizations.of(context)!.above20],
                count: [
                  state.coursesData.ageData
                      .map((value) => value.lte_20)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.coursesData.ageData
                      .map((value) => value.gt_20)
                      .toList()
                      .reduce((a, b) => a + b),
                ],
                titleColor: Colors.black,
                countColor: AppColors.professionalDecorativeColor,
                titleSize: 16,
                countSize: 18,
                alignment: MainAxisAlignment.spaceEvenly,
                isWrap: false,
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles:
                    state.coursesData.ageData
                        .map((value) => "${value.education_type}-kurs")
                        .toList(),
                statisticLabelColor:
                    state.coursesData.ageData
                        .map((value) => "${value.education_type}-kurs")
                        .toList()
                        .map(
                          (value) => [
                            AppColors.circleStatisticBlueChart,
                            AppColors.mainColor,
                          ],
                        )
                        .toList(),
                statisticItemNumber: [
                  for (var i
                      in state.coursesData.ageData
                          .map((value) => value.education_type)
                          .toList())
                    for (var z in state.coursesData.ageData)
                      if (i == z.education_type) [z.lte_20, z.gt_20],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor:
                    state.coursesData.ageData
                        .map((value) => "${value.education_type}-kurs")
                        .toList()
                        .map(
                          (value) => [
                            AppColors.circleStatisticBlueChart,
                            AppColors.mainColor,
                          ],
                        )
                        .toList(),
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
              ),
              ShowRectangleTitle(
                title: ["20 yoshdan kichiklar", "20 yoshdan kattalar"],
                colors: [
                  AppColors.circleStatisticBlueChart,
                  AppColors.mainColor,
                ],
                titleColor: AppColors.professionalDecorativeColor,
              ),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: "Yoshi",
            titleColor: AppColors.professionalDecorativeColor,
          );
        }
      },
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class ProfessionalAreasSectionAgeData extends StatelessWidget {
  const ProfessionalAreasSectionAgeData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.areasSectionResponseData.ageData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.age,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.professionalDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              StatisticTitleCount(
                title: [AppLocalizations.of(context)!.under20,AppLocalizations.of(context)!.above20],
                count: [
                  state.areasSectionResponseData.ageData
                      .map((value) => value.lte_20)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.areasSectionResponseData.ageData
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
              ShowMultiStatisticChart(
                statisticTitles: state.areasSectionResponseData.ageData.map((value) => value.education_type).toList(),
                statisticLabelColor: state.areasSectionResponseData.ageData.map((value) => value.education_type).toList().map((value) => [AppColors.circleStatisticBlueChart,AppColors.mainColor]).toList(),
                statisticItemNumber: state.areasSectionResponseData.ageData.map((value) => [value.lte_20,value.gt_20]).toList(),
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: state.areasSectionResponseData.ageData.map((value) => value.education_type).toList().map((value) => [AppColors.circleStatisticBlueChart,AppColors.mainColor]).toList(),
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelPercent: 60,
                labelCountPercent: 20,
              ),
              ShowRectangleTitle(title: ["20 yoshdan kichiklar","20 yoshdan kattalar"], colors: [AppColors.circleStatisticBlueChart,AppColors.mainColor], titleColor: AppColors.professionalDecorativeColor,),
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

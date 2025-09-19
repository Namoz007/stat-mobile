import 'package:stat_edu_mobile/sources.dart';

class ProfessionalAreasSectionEducationTypeData extends StatelessWidget {
  const ProfessionalAreasSectionEducationTypeData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.areasSectionResponseData.educationTypeData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.educationType,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.professionalDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              StatisticTitleCount(
                title: ["Kasb-hunar maktabi", "Kollej", "Texnikum"],
                count: [
                  state.areasSectionResponseData.educationTypeData
                      .map((value) => value.khm)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.areasSectionResponseData.educationTypeData
                      .map((value) => value.college)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.areasSectionResponseData.educationTypeData
                      .map((value) => value.technical)
                      .toList()
                      .reduce((a, b) => a + b),
                ],
                titleColor: Colors.black,
                countColor: AppColors.professionalDecorativeColor,
                titleSize: 16,
                countSize: 18,
                alignment: MainAxisAlignment.spaceEvenly,
                isWrap: true,
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles: state.areasSectionResponseData.educationTypeData.map((value) => value.region).toList(),
                statisticLabelColor: state.areasSectionResponseData.educationTypeData.map((value) => value.region).toList().map((value) => [AppColors.amberCircleChartColor,AppColors.circleStatisticBlueChart,AppColors.greenBarChart]).toList(),
                statisticItemNumber: state.areasSectionResponseData.educationTypeData.map((value) => [value.khm,value.college,value.technical]).toList(),
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: state.areasSectionResponseData.educationTypeData.map((value) => value.region).toList().map((value) => [AppColors.amberCircleChartColor,AppColors.circleStatisticBlueChart,AppColors.greenBarChart]).toList(),
                statisticLineCount: 5,
                labelHeight: 28,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelCountPercent: 20,
                labelPercent: 60,
              ),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: "Ta'lim turi",
            titleColor: AppColors.professionalDecorativeColor,
          );
        }
      },
    );
  }
}

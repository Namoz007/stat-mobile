import 'package:stat_edu_mobile/sources.dart';

class ProfessionalStudentsAgeStatisticData extends StatelessWidget {
  const ProfessionalStudentsAgeStatisticData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if(!state.educationTypeData.collegeAgeData.empty){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.age,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.professionalDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.under20,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state.educationTypeData.collegeAgeData.lte_20 +
                              state
                                  .educationTypeData
                                  .technicalCollegeAgeData
                                  .lte_20,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.above20,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state.educationTypeData.collegeAgeData.gt_20 +
                              state
                                  .educationTypeData
                                  .technicalCollegeAgeData
                                  .gt_20,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles: ["Kasb-hunar maktablari", "Kollejlar"],
                statisticLabelColor: [
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                  ],
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                  ],
                ],
                statisticItemNumber: [
                  [
                    state.educationTypeData.collegeAgeData.lte_20,
                    state.educationTypeData.collegeAgeData.gt_20,
                  ],
                  [
                    state.educationTypeData.technicalCollegeAgeData.lte_20,
                    state.educationTypeData.technicalCollegeAgeData.gt_20,
                  ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                  ],
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                  ],
                ],
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelPercent: 60,
                labelCountPercent: 20,
              ),
              const SizedBox(height: 12),
              ShowRectangleTitle(
                title: ['20 yoshdan kichiklar','20 yoshdan kattalar'],
                colors: [AppColors.amberCircleChartColor,AppColors.circleStatisticBlueChart,],
                titleColor: AppColors.professionalDecorativeColor,
              ),
              const SizedBox(height: 12,),
            ],
          );
        }else{
          return ShowLoadingWidget(title: "Yoshi", titleColor: AppColors.professionalDecorativeColor);
        }
      },
    );
  }
}

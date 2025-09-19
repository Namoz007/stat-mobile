import 'package:stat_edu_mobile/sources.dart';

class ProfessionalStudentsCourseData extends StatelessWidget {
  const ProfessionalStudentsCourseData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (!state.educationTypeData.collegeCourseData.empty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.courses,
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
                    children: [
                      Text(
                        AppLocalizations.of(context)!.firstCourse,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state.educationTypeData.collegeCourseData.course1 +
                              state
                                  .educationTypeData
                                  .technicalCollegeCourseData
                                  .course1,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.secondCourse,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state.educationTypeData.collegeCourseData.course2 +
                              state
                                  .educationTypeData
                                  .technicalCollegeCourseData
                                  .course2,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.thirdCourse,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state.educationTypeData.collegeCourseData.course3 +
                              state
                                  .educationTypeData
                                  .technicalCollegeCourseData
                                  .course3,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles: [
                  "Kasb-hunar maktablari",
                  "Kollejlar",
                ],
                statisticLabelColor: [
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                    AppColors.greenBarChart,
                  ],
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                    AppColors.greenBarChart,
                  ],
                ],
                statisticItemNumber: [
                  [
                    state.educationTypeData.collegeCourseData.course1,
                    state.educationTypeData.collegeCourseData.course2,
                    state.educationTypeData.collegeCourseData.course3,
                  ],
                  [
                    state.educationTypeData.technicalCollegeCourseData.course1,
                    state.educationTypeData.technicalCollegeCourseData.course2,
                    state.educationTypeData.technicalCollegeCourseData.course3,
                  ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                    AppColors.greenBarChart,
                  ],
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                    AppColors.greenBarChart,
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
              ShowRectangleTitle(title: [
                "1-kurs",'2-kurs','3-kurs',
              ], colors: [
                AppColors.amberCircleChartColor,
                AppColors.circleStatisticBlueChart,
                AppColors.greenBarChart,
              ], titleColor: AppColors.professionalDecorativeColor,),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: AppLocalizations.of(context)!.courses,
            titleColor: AppColors.professionalDecorativeColor,
          );
        }
      },
    );
  }
}

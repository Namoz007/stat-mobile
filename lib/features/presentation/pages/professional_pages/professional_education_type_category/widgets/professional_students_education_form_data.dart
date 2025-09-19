import 'package:stat_edu_mobile/sources.dart';

class ProfessionalStudentsEducationFormData extends StatelessWidget {
  const ProfessionalStudentsEducationFormData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (!state.educationTypeData.collegeEducationFormData.empty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.educationForm,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.professionalDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                children: [
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.daytime,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state
                              .educationTypeData
                              .collegeEducationFormData
                              .day_time +
                              state
                                  .educationTypeData
                                  .technicalCollegeEducationFormData
                                  .day_time,
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.evening,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state
                              .educationTypeData
                              .collegeEducationFormData
                              .day_time +
                              state
                                  .educationTypeData
                                  .technicalCollegeEducationFormData
                                  .day_time,
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.external,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state
                              .educationTypeData
                              .collegeEducationFormData
                              .day_time +
                              state
                                  .educationTypeData
                                  .technicalCollegeEducationFormData
                                  .day_time,
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dual,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state
                              .educationTypeData
                              .collegeEducationFormData
                              .day_time +
                              state
                                  .educationTypeData
                                  .technicalCollegeEducationFormData
                                  .day_time,
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles: [
                  "Kollejlar","Kasb-hunar maktablari",
                ],
                statisticLabelColor: [
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                    AppColors.greenBarChart,
                    AppColors.mainColor,
                  ],
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                    AppColors.greenBarChart,
                    AppColors.mainColor,
                  ],
                ],
                statisticItemNumber: [
                  [
                    state.educationTypeData.collegeEducationFormData.day_time,
                    state.educationTypeData.collegeEducationFormData.evening,
                    state.educationTypeData.collegeEducationFormData.external,
                    state.educationTypeData.collegeEducationFormData.dual,
                  ],
                  [
                    state.educationTypeData.technicalCollegeEducationFormData.day_time,
                    state.educationTypeData.technicalCollegeEducationFormData.evening,
                    state.educationTypeData.technicalCollegeEducationFormData.external,
                    state.educationTypeData.technicalCollegeEducationFormData.dual,
                  ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                    AppColors.greenBarChart,
                    AppColors.mainColor,
                  ],
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                    AppColors.greenBarChart,
                    AppColors.mainColor,
                  ],
                ],
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelCountPercent: 20,
                labelPercent: 60,
              ),
              ShowRectangleTitle(title: ["Kunduzgi","Kechki","Sirtqi","Dual"], colors: [
                AppColors.amberCircleChartColor,
                AppColors.circleStatisticBlueChart,
                AppColors.greenBarChart,
                AppColors.mainColor,
              ], titleColor: AppColors.professionalDecorativeColor,),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: AppLocalizations.of(context)!.educationForm,
            titleColor: AppColors.professionalDecorativeColor,
          );
        }
      },
    );
  }
}

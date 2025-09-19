import 'package:stat_edu_mobile/sources.dart';

class ProfessionalStudentsCitizenshipData extends StatelessWidget {
  const ProfessionalStudentsCitizenshipData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (!state.educationTypeData.collegeCitizenshipData.empty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.citizenship,
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
                        AppLocalizations.of(context)!.uzbekCitizen,
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
                              .collegeCitizenshipData
                              .countyCitizenshipCount +
                              state
                                  .educationTypeData
                                  .technicalCollegeCitizenshipData
                                  .countyCitizenshipCount,
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.foreignCitizen,
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
                              .collegeCitizenshipData
                              .foreignCitizenshipCount +
                              state
                                  .educationTypeData
                                  .technicalCollegeCitizenshipData
                                  .foreignCitizenshipCount,
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),

                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.noCitizenship,
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
                              .collegeCitizenshipData
                              .notCitizenshipCount +
                              state
                                  .educationTypeData
                                  .technicalCollegeCitizenshipData
                                  .notCitizenshipCount,
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.under18,
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
                              .collegeCitizenshipData
                              .minorCount +
                              state
                                  .educationTypeData
                                  .technicalCollegeCitizenshipData
                                  .minorCount,
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
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
                    state.educationTypeData.collegeCitizenshipData.countyCitizenshipCount,
                    state.educationTypeData.collegeCitizenshipData.foreignCitizenshipCount,
                    state.educationTypeData.collegeCitizenshipData.notCitizenshipCount,
                    state.educationTypeData.collegeCitizenshipData.minorCount,
                  ],
                  [
                    state.educationTypeData.technicalCollegeCitizenshipData.countyCitizenshipCount,
                    state.educationTypeData.technicalCollegeCitizenshipData.foreignCitizenshipCount,
                    state.educationTypeData.technicalCollegeCitizenshipData.notCitizenshipCount,
                    state.educationTypeData.technicalCollegeCitizenshipData.minorCount,
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
                labelPercent: 60,
                labelCountPercent: 20,
              ),
              ShowRectangleTitle(title: [
                "O‘zbekiston Respublikasi fuqarosi","Xorijiy davlat fuqarosi","Fuqaroligi yo‘q shaxslar","Voyaga yetmagan shaxslar",
              ], colors: [
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
            title: AppLocalizations.of(context)!.citizenship,
            titleColor: AppColors.professionalDecorativeColor,
          );
        }
      },
    );
  }
}


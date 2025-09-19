import 'package:stat_edu_mobile/sources.dart';

class ProfessionalStudentsResidenceData extends StatelessWidget {
  const ProfessionalStudentsResidenceData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (!state.educationTypeData.collegeResidenceData.empty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.residenceRegion,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.professionalDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                children: [
                  Column(
                    children: [
                      Text(
                    AppLocalizations.of(context)!.ownHouse,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state
                              .educationTypeData
                              .collegeResidenceData
                              .houseLiveCount +
                              state
                                  .educationTypeData
                                  .technicalCollegeResidenceData
                                  .houseLiveCount,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dormitory,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state
                              .educationTypeData
                              .collegeResidenceData
                              .houseLiveCount +
                              state
                                  .educationTypeData
                                  .technicalCollegeResidenceData
                                  .houseLiveCount,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.rentedHouse,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state
                              .educationTypeData
                              .collegeResidenceData
                              .houseLiveCount +
                              state
                                  .educationTypeData
                                  .technicalCollegeResidenceData
                                  .houseLiveCount,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.relativeHouse,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state
                              .educationTypeData
                              .collegeResidenceData
                              .houseLiveCount +
                              state
                                  .educationTypeData
                                  .technicalCollegeResidenceData
                                  .houseLiveCount,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.friendHouse,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state
                              .educationTypeData
                              .collegeResidenceData
                              .houseLiveCount +
                              state
                                  .educationTypeData
                                  .technicalCollegeResidenceData
                                  .houseLiveCount,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.other,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state
                              .educationTypeData
                              .collegeResidenceData
                              .houseLiveCount +
                              state
                                  .educationTypeData
                                  .technicalCollegeResidenceData
                                  .houseLiveCount,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                ],
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles: ["Kollejlar", "Texnikumlar"],
                statisticLabelColor: [
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                    AppColors.greenBarChart,
                    AppColors.mainColor,
                    AppColors.lightBlueChartColor,
                    AppColors.purpleChartColor,
                  ],
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                    AppColors.greenBarChart,
                    AppColors.mainColor,
                    AppColors.lightBlueChartColor,
                    AppColors.purpleChartColor,
                  ],
                ],
                statisticItemNumber: [
                  [
                    state.educationTypeData.collegeResidenceData.houseLiveCount,
                    state
                        .educationTypeData
                        .collegeResidenceData
                        .studentsHouseLiveCount,
                    state
                        .educationTypeData
                        .collegeResidenceData
                        .rentalHouseLiveCount,
                    state
                        .educationTypeData
                        .collegeResidenceData
                        .relativeHouseLiveCount,
                    state
                        .educationTypeData
                        .collegeResidenceData
                        .familiarHouseLiveCount,
                    state.educationTypeData.collegeResidenceData.otherLiveCount,
                  ],
                  [
                    state
                        .educationTypeData
                        .technicalCollegeResidenceData
                        .houseLiveCount,
                    state
                        .educationTypeData
                        .technicalCollegeResidenceData
                        .studentsHouseLiveCount,
                    state
                        .educationTypeData
                        .technicalCollegeResidenceData
                        .rentalHouseLiveCount,
                    state
                        .educationTypeData
                        .technicalCollegeResidenceData
                        .relativeHouseLiveCount,
                    state
                        .educationTypeData
                        .technicalCollegeResidenceData
                        .familiarHouseLiveCount,
                    state
                        .educationTypeData
                        .technicalCollegeResidenceData
                        .otherLiveCount,
                  ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                    AppColors.greenBarChart,
                    AppColors.mainColor,
                    AppColors.lightBlueChartColor,
                    AppColors.purpleChartColor,
                  ],
                  [
                    AppColors.amberCircleChartColor,
                    AppColors.circleStatisticBlueChart,
                    AppColors.greenBarChart,
                    AppColors.mainColor,
                    AppColors.lightBlueChartColor,
                    AppColors.purpleChartColor,
                  ],
                ],
                statisticLineCount: 5,
                labelHeight: 35,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelPercent: 60,
                labelCountPercent: 20,
              ),
              ShowRectangleTitle(
                title: [
                  "O‘z uyida","Talabalar turar joyida",'Ijaradagi uyda','Qarindoshining uyida','Tanishining uyida','Boshqa',
                ],
                colors: [
                  AppColors.amberCircleChartColor,
                  AppColors.circleStatisticBlueChart,
                  AppColors.greenBarChart,
                  AppColors.mainColor,
                  AppColors.lightBlueChartColor,
                  AppColors.purpleChartColor,
                ],
                titleColor: AppColors.professionalDecorativeColor,
              ),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: AppLocalizations.of(context)!.residenceRegion,
            titleColor: AppColors.professionalDecorativeColor,
          );
        }
      },
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class ProfessionalStudentsPaymentData extends StatelessWidget {
  const ProfessionalStudentsPaymentData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (!state.educationTypeData.collegeAdmissionData.empty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.paymentForm,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
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
                        AppLocalizations.of(context)!.stateGrant,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.otmStudentsPageDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state
                              .educationTypeData
                              .collegeAdmissionData
                              .grandCount +
                              state
                                  .educationTypeData
                                  .technicalCollegeAdmissionData
                                  .grandCount,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.contractBased,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.otmStudentsPageDecorativeColor,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state
                              .educationTypeData
                              .collegeAdmissionData
                              .contractCount +
                              state
                                  .educationTypeData
                                  .technicalCollegeAdmissionData
                                  .contractCount,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.professionalDecorativeColor,
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
                    state.educationTypeData.collegeAdmissionData.grandCount,
                    state.educationTypeData.collegeAdmissionData.contractCount,
                  ],
                  [
                    state
                        .educationTypeData
                        .technicalCollegeAdmissionData
                        .grandCount,
                    state
                        .educationTypeData
                        .technicalCollegeAdmissionData
                        .contractCount,
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
                labelCountPercent: 20,
                labelPercent: 60,
              ),
              ShowRectangleTitle(
                title: ["Davlat granti", "To'lov-kontrakt"],
                colors: [
                  AppColors.amberCircleChartColor,
                  AppColors.circleStatisticBlueChart,
                ],
                titleColor: AppColors.professionalDecorativeColor,
              ),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: AppLocalizations.of(context)!.paymentForm,
            titleColor: AppColors.professionalDecorativeColor,
          );
        }
      },
    );
  }
}

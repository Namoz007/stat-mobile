import 'package:stat_edu_mobile/sources.dart';

class ProfessionalPaymentFormCitizenshipData extends StatelessWidget {
  const ProfessionalPaymentFormCitizenshipData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.paymentFormData.citizenshipData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.citizenship,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.professionalDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              StatisticTitleCount(
                title: [
                  AppLocalizations.of(context)!.uzbekCitizen,
                  AppLocalizations.of(context)!.foreignCitizen,
                  AppLocalizations.of(context)!.noCitizenship,
                  AppLocalizations.of(context)!.under18,],
                count: [
                  state.paymentFormData.citizenshipData
                      .map((value) => value.countyCitizenshipCount)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.paymentFormData.citizenshipData
                      .map((value) => value.foreignCitizenshipCount)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.paymentFormData.citizenshipData
                      .map((value) => value.notCitizenshipCount)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.paymentFormData.citizenshipData
                      .map((value) => value.minorCount)
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
                statisticTitles: state.paymentFormData.citizenshipData.map((value) => formatPaymentTypeWithKey(value.education_type)).toList(),
                statisticLabelColor: state.paymentFormData.citizenshipData.map((value) => formatPaymentTypeWithKey(value.education_type)).toList().map((value) => [AppColors.amberCircleChartColor,AppColors.circleStatisticBlueChart,AppColors.greenBarChart,AppColors.mainColor,]).toList(),
                statisticItemNumber: [
                  for(var i in state.paymentFormData.citizenshipData.map((value) => value.education_type).toList())
                    for(var z in state.paymentFormData.citizenshipData)
                      if(i == z.education_type)
                        [z.countyCitizenshipCount,z.foreignCitizenshipCount,z.notCitizenshipCount,z.minorCount,]
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: state.paymentFormData.citizenshipData.map((value) => formatPaymentTypeWithKey(value.education_type)).toList().map((value) => [AppColors.amberCircleChartColor,AppColors.circleStatisticBlueChart,AppColors.greenBarChart,AppColors.mainColor,]).toList(),
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 25,
                labelCountPercent: 20,
                labelPercent: 55,
              ),
              ShowRectangleTitle(title: [
        AppLocalizations.of(context)!.uzbekCitizen,
        AppLocalizations.of(context)!.foreignCitizen,
        AppLocalizations.of(context)!.noCitizenship,
        AppLocalizations.of(context)!.under18,
              ], colors: [AppColors.amberCircleChartColor,AppColors.circleStatisticBlueChart,AppColors.greenBarChart,AppColors.mainColor], titleColor: AppColors.professionalDecorativeColor,),
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

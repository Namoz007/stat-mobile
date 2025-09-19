import 'package:stat_edu_mobile/sources.dart';

class ProfessionalEducationFormPaymentFormData extends StatelessWidget {
  const ProfessionalEducationFormPaymentFormData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.educationFormData.citizenshipData.isNotEmpty) {
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
              StatisticTitleCount(
                title: [AppLocalizations.of(context)!.stateGrant, AppLocalizations.of(context)!.contractBased],
                count: [
                  state.educationFormData.admissionData
                      .map((value) => value.grandCount)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.educationFormData.admissionData
                      .map((value) => value.contractCount)
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
                statisticTitles: state.educationFormData.admissionData.map((value) => value.education_type).toList(),
                statisticLabelColor: state.educationFormData.admissionData.map((value) => value.education_type).toList().map((value) => [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart]).toList(),
                statisticItemNumber: [
                  for(var i in state.educationFormData.admissionData.map((value) => value.education_type).toList())
                    for(var z in state.educationFormData.admissionData)
                      if(i == z.education_type)
                        [z.grandCount,z.contractCount]
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: state.educationFormData.admissionData.map((value) => value.education_type).toList().map((value) => [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart]).toList(),
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelPercent: 60,
                labelCountPercent: 20,
              ),
              ShowRectangleTitle(title: ["Davlat granti","To'lov-kontrakt"], colors: [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart], titleColor: AppColors.professionalDecorativeColor,),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: "To'lov shakli",
            titleColor: AppColors.professionalDecorativeColor,
          );
        }
      },
    );
  }
}

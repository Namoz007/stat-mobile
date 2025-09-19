import 'package:stat_edu_mobile/sources.dart';

class ProfessionalPaymentFormAgeData extends StatelessWidget {
  const ProfessionalPaymentFormAgeData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.paymentFormData.ageData.isNotEmpty) {
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
                title: [AppLocalizations.of(context)!.unders20, AppLocalizations.of(context)!.above20],
                count: [
                  state.paymentFormData.ageData
                      .map((value) => value.lte_20)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.paymentFormData.ageData
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
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles: state.paymentFormData.ageData.map((value) => formatPaymentTypeWithKey(value.education_type)).toList(),
                statisticLabelColor: state.paymentFormData.ageData.map((value) => formatPaymentTypeWithKey(value.education_type)).toList().map((value) => [AppColors.circleStatisticBlueChart,AppColors.mainColor]).toList(),
                statisticItemNumber: [
                  for(var i in state.paymentFormData.ageData.map((value) => value.education_type).toList())
                    for(var z in state.paymentFormData.ageData)
                      if(i == z.education_type)
                        [z.lte_20,z.gt_20]
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: state.paymentFormData.ageData.map((value) => formatPaymentTypeWithKey(value.education_type)).toList().map((value) => [AppColors.circleStatisticBlueChart,AppColors.mainColor]).toList(),
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 25,
                labelPercent: 55,
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

import 'package:stat_edu_mobile/sources.dart';

class ProfessionalPaymentFormGenderData extends StatelessWidget {
  const ProfessionalPaymentFormGenderData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.paymentFormData.genderData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.byGender,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.professionalDecorativeColor,
                ),
              ),
              const SizedBox(height: 12,),
              StatisticTitleCount(title: [AppLocalizations.of(context)!.men,AppLocalizations.of(context)!.women], count: [state.paymentFormData.genderData.map((value) => value.maleCount).toList().reduce((a,b) => a +b),state.paymentFormData.genderData.map((value) => value.femaleCount).toList().reduce((a,b) => a + b),], titleColor: Colors.black, countColor: AppColors.professionalDecorativeColor, titleSize: 16, countSize: 18, alignment: MainAxisAlignment.spaceEvenly, isWrap: false,),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles: state.paymentFormData.genderData.map((value) => formatPaymentTypeWithKey(value.education_type)).toList(),
                statisticLabelColor: state.paymentFormData.genderData.map((value) => value.education_type).toList().map((value) => [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart,]).toList(),
                statisticItemNumber: [
                  for(var i in state.paymentFormData.genderData.map((value) => value.education_type).toList())
                    for(var z in state.paymentFormData.genderData)
                      if(i == z.education_type)
                        [z.maleCount,z.femaleCount]
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: state.paymentFormData.genderData.map((value) => value.education_type).toList().map((value) => [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart,]).toList(),
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 25,
                labelCountPercent: 20,
                labelPercent: 55,
              ),
              ShowRectangleTitle(title: ["Erkaklar","Ayollar"], colors: [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart], titleColor: AppColors.professionalDecorativeColor,),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: "Jinsi bo'yicha ",
            titleColor: AppColors.professionalDecorativeColor,
          );
        }
      },
    );
  }
}

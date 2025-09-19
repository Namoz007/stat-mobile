import 'package:stat_edu_mobile/sources.dart';

class ProfessionalResidenceAreaGenderData extends StatelessWidget {
  const ProfessionalResidenceAreaGenderData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.residenceAreaResponseData.genderData.isNotEmpty) {
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
              const SizedBox(height: 12),
              StatisticTitleCount(
                title: [AppLocalizations.of(context)!.men,AppLocalizations.of(context)!.women],
                count: [
                  state.residenceAreaResponseData.genderData
                      .map((value) => value.gt_20)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.residenceAreaResponseData.genderData
                      .map((value) => value.lte_20)
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
                statisticTitles: state.residenceAreaResponseData.genderData.map((value) => value.current_live_place).toList(),
                statisticLabelColor: state.residenceAreaResponseData.genderData.map((value) => value.current_live_place).toList().map((value) => [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart,]).toList(),
                statisticItemNumber: state.residenceAreaResponseData.genderData.map((value) => [value.gt_20,value.lte_20]).toList(),
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: state.residenceAreaResponseData.genderData.map((value) => value.current_live_place).toList().map((value) => [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart,]).toList(),
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelCountPercent: 20,
                labelPercent: 60,
              ),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: AppLocalizations.of(context)!.byGender,
            titleColor: AppColors.professionalTypeIconColor,
          );
        }
      },
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class ProfessionalAgeGenderData extends StatelessWidget {
  const ProfessionalAgeGenderData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.ageResponseData.genderData.isNotEmpty) {
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
                  state.ageResponseData.genderData
                      .where((value) => value.education_type == '1')
                      .toList()
                      .map((value) => value.lte_20 + value.gt_20)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.ageResponseData.genderData
                      .where((value) => value.education_type == '2')
                      .toList()
                      .map((value) => value.lte_20 + value.gt_20)
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
                statisticTitles: [AppLocalizations.of(context)!.under20,AppLocalizations.of(context)!.above20],
                statisticLabelColor: [
                  [
                    AppColors.circleStatisticBlueChart,
                    AppColors.circleStatisticPinkChart,
                  ],
                  [
                    AppColors.circleStatisticBlueChart,
                    AppColors.circleStatisticPinkChart,
                  ],
                ],
                statisticItemNumber: [
                  [
                    state.ageResponseData.genderData.where((value) => value.education_type == '1').toList().map((value) => value.lte_20).toList().reduce((a,b) => a + b),
                    state.ageResponseData.genderData.where((value) => value.education_type == '2').toList().map((value) => value.lte_20).toList().reduce((a,b) => a + b),
                  ],
                  [
                    state.ageResponseData.genderData.where((value) => value.education_type == '1').toList().map((value) => value.gt_20).toList().reduce((a,b) => a + b),
                    state.ageResponseData.genderData.where((value) => value.education_type == '2').toList().map((value) => value.gt_20).toList().reduce((a,b) => a + b),
                  ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  [
                    AppColors.circleStatisticBlueChart,
                    AppColors.circleStatisticPinkChart,
                  ],
                  [
                    AppColors.circleStatisticBlueChart,
                    AppColors.circleStatisticPinkChart,
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
              ShowRectangleTitle(title: ['Erkaklar','Ayollar'], colors: [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart], titleColor: AppColors.professionalDecorativeColor,),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: AppLocalizations.of(context)!.byGender,
            titleColor: AppColors.professionalDecorativeColor,
          );
        }
      },
    );
  }
}

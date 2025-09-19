import 'package:stat_edu_mobile/sources.dart';

class ProfessionalCitizenshipAgeData extends StatelessWidget {
  const ProfessionalCitizenshipAgeData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.citizenshipResponseData.ageData.isNotEmpty) {
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
                title: [AppLocalizations.of(context)!.unders20, AppLocalizations.of(context)!.unders20],
                count: [
                  state.citizenshipResponseData.ageData
                      .map((value) => value.lte_20)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.citizenshipResponseData.ageData
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
                statisticTitles: state.citizenshipResponseData.ageData.map((value) => value.education_type).toList(),
                statisticLabelColor: state.citizenshipResponseData.ageData.map((value) => value.education_type).toList().map((value) => [AppColors.circleStatisticBlueChart,AppColors.mainColor]).toList(),
                statisticItemNumber: [
                  for(var i in  state.citizenshipResponseData.ageData.map((value) => value.education_type).toList())
                    for(var z in state.citizenshipResponseData.ageData)
                      if(i == z.education_type)
                        [z.lte_20,z.gt_20]
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: state.citizenshipResponseData.ageData.map((value) => value.education_type).toList().map((value) => [AppColors.circleStatisticBlueChart,AppColors.mainColor]).toList(),
                statisticLineCount: 4,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 25,
                labelCountPercent: 20,
                labelPercent: 55,
              ),
              ShowRectangleTitle(title: [AppLocalizations.of(context)!.unders20,AppLocalizations.of(context)!.unders20], colors: [AppColors.circleStatisticBlueChart,AppColors.mainColor], titleColor: AppColors.professionalDecorativeColor,),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: AppLocalizations.of(context)!.age,
            titleColor: AppColors.professionalDecorativeColor,
          );
        }
      },
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class ProfessionalResidenceData extends StatelessWidget {
  const ProfessionalResidenceData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.ageResponseData.residenceData.isNotEmpty) {
          Map<String, Color> residenceData = {};
          state.ageResponseData.residenceData
              .map((value) => value.current_live_place)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) => residenceData[value] = AppColors.allColors[key],
              );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.residenceRegion,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.professionalDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              StatisticTitleCount(
                title: residenceData.keys.toList(),
                count:
                    residenceData.keys
                        .toList()
                        .map(
                          (value) => state.ageResponseData.residenceData
                              .where((v) => v.current_live_place == value)
                              .toList()
                              .map((v) => v.lte_20 + v.gt_20)
                              .toList()
                              .reduce((a, b) => a + b),
                        )
                        .toList(),
                titleColor: Colors.black,
                countColor: AppColors.professionalDecorativeColor,
                titleSize: 16,
                countSize: 18,
                alignment: MainAxisAlignment.spaceEvenly,
                isWrap: true,
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles: [
        AppLocalizations.of(context)!.under20,AppLocalizations.of(context)!.above20
                ],
                statisticLabelColor: [
                  residenceData.values.toList(),
                  residenceData.values.toList(),
                ],
                statisticItemNumber: [
                  [
                    for(var i in residenceData.keys.toList())
                      for(var z in state.ageResponseData.residenceData)
                        if(i == z.current_live_place)
                          z.lte_20
                  ],
                  [
                    for(var i in residenceData.keys.toList())
                      for(var z in state.ageResponseData.residenceData)
                        if(i == z.current_live_place)
                          z.gt_20
                  ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  residenceData.values.toList(),
                  residenceData.values.toList(),
                ],
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelPercent: 60,
                labelCountPercent: 20,
              ),
              ShowRectangleTitle(
                title: residenceData.keys.toList(),
                colors: residenceData.values.toList(),
                titleColor: AppColors.professionalDecorativeColor,
              ),
              const SizedBox(height: 12),
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

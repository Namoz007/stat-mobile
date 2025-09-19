import 'package:stat_edu_mobile/sources.dart';

class ProfessionalAreasSectionGenderData extends StatelessWidget {
  const ProfessionalAreasSectionGenderData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.areasSectionResponseData.genderData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.byGender,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.professionalDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              StatisticTitleCount(
                title: [AppLocalizations.of(context)!.men,AppLocalizations.of(context)!.women],
                count: [
                  state.areasSectionResponseData.genderData
                      .map((value) => value.maleCount)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.areasSectionResponseData.genderData
                      .map((value) => value.femaleCount)
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
                statisticTitles:
                    state.areasSectionResponseData.genderData
                        .map((value) => value.education_type)
                        .toList(),
                statisticLabelColor:
                    state.areasSectionResponseData.genderData
                        .map((value) => value.education_type)
                        .toList()
                        .map(
                          (value) => [
                            AppColors.circleStatisticBlueChart,
                            AppColors.circleStatisticPinkChart,
                          ],
                        )
                        .toList(),
                statisticItemNumber:
                    state.areasSectionResponseData.genderData
                        .map((value) => [value.maleCount, value.femaleCount])
                        .toList(),
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor:
                    state.areasSectionResponseData.genderData
                        .map((value) => value.education_type)
                        .toList()
                        .map(
                          (value) => [
                            AppColors.circleStatisticBlueChart,
                            AppColors.circleStatisticPinkChart,
                          ],
                        )
                        .toList(),
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelPercent: 60,
                labelCountPercent: 20,
              ),
              ShowRectangleTitle(
                title: [AppLocalizations.of(context)!.men,AppLocalizations.of(context)!.women],
                colors: [
                  AppColors.circleStatisticBlueChart,
                  AppColors.circleStatisticPinkChart,
                ],
                titleColor: AppColors.professionalDecorativeColor,
              ),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: "Jinsi bo'yicha",
            titleColor: AppColors.professionalDecorativeColor,
          );
        }
      },
    );
  }
}

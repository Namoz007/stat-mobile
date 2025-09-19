import 'package:stat_edu_mobile/sources.dart';

class ProfessionalCitizenshipGenderData extends StatelessWidget {
  const ProfessionalCitizenshipGenderData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.citizenshipResponseData.genderData.isNotEmpty) {
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
                title: [AppLocalizations.of(context)!.men, AppLocalizations.of(context)!.women],
                count: [
                  state.citizenshipResponseData.genderData
                      .map((value) => value.maleCount)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.citizenshipResponseData.genderData
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
                    state.citizenshipResponseData.genderData
                        .map((value) => value.education_type)
                        .toList(),
                statisticLabelColor:
                    state.citizenshipResponseData.genderData
                        .map((value) => value.education_type)
                        .toList()
                        .map(
                          (value) => [
                            AppColors.circleStatisticBlueChart,
                            AppColors.circleStatisticPinkChart,
                          ],
                        )
                        .toList(),
                statisticItemNumber: [
                  for (var i
                      in state.citizenshipResponseData.genderData
                          .map((value) => value.education_type)
                          .toList())
                    for (var z in state.citizenshipResponseData.genderData)
                      if (i == z.education_type) [z.maleCount, z.femaleCount],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor:
                    state.citizenshipResponseData.genderData
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
                titlePercent: 25,
                labelPercent: 55,
                labelCountPercent: 20,
              ),
              ShowRectangleTitle(
                title: [AppLocalizations.of(context)!.men, AppLocalizations.of(context)!.women],
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
            title: AppLocalizations.of(context)!.byGender,
            titleColor: AppColors.professionalDecorativeColor,
          );
        }
      },
    );
  }
}

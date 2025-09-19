import 'package:stat_edu_mobile/sources.dart';

class ProfessionalEducationFormGenderData extends StatelessWidget {
  const ProfessionalEducationFormGenderData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.educationFormData.genderData.isNotEmpty) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.men,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state.educationFormData.genderData
                              .map((value) => value.maleCount)
                              .toList()
                              .reduce((a, b) => a + b),
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.women,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state.educationFormData.genderData
                              .map((value) => value.femaleCount)
                              .toList()
                              .reduce((a, b) => a + b),
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles: state.educationFormData.genderData.map((value) => value.education_type).toList(),
                statisticLabelColor: state.educationFormData.genderData.map((value) => value.education_type).toList().map((value) => [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart,]).toList(),
                statisticItemNumber: [
                  for(var i in state.educationFormData.genderData.map((value) => value.education_type).toList())
                    [
                      for(var z in state.educationFormData.genderData)
                        if(i == z.education_type)
                          z.maleCount,

                      for(var z in state.educationFormData.genderData)
                        if(i == z.education_type)
                          z.femaleCount
                    ]
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: state.educationFormData.genderData.map((value) => value.education_type).toList().map((value) => [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart,]).toList(),
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
            title: "Jinsi bo'yicha",
            titleColor: AppColors.professionalDecorativeColor,
          );
        }
      },
    );
  }
}

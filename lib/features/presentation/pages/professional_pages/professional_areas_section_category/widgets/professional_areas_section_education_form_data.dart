import 'package:stat_edu_mobile/sources.dart';

class ProfessionalAreasSectionEducationFormData extends StatelessWidget {
  const ProfessionalAreasSectionEducationFormData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.areasSectionResponseData.educationFormData.isNotEmpty) {
          Map<String, List<int>> educationFormData = {
          AppLocalizations.of(context)!.daytime:
                state.areasSectionResponseData.educationFormData
                    .map((value) => value.day_time)
                    .toList(),
          AppLocalizations.of(context)!.evening:
                state.areasSectionResponseData.educationFormData
                    .map((value) => value.evening)
                    .toList(),
          AppLocalizations.of(context)!.external:
                state.areasSectionResponseData.educationFormData
                    .map((value) => value.external)
                    .toList(),
          AppLocalizations.of(context)!.dual:
                state.areasSectionResponseData.educationFormData
                    .map((value) => value.dual)
                    .toList(),
          };
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(educationFormData.keys.toList().length, (
              index,
            ) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomOtmContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.educationForm}:${educationFormData.keys.toList()[index]}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ShowStatisticChart(
                        statisticTitles: state.areasSectionResponseData.educationFormData.map((value) => value.region).toList(),
                        statisticLabelColor: AppColors.circleStatisticBlueChart,
                        statisticItemNumber: educationFormData[educationFormData.keys.toList()[index]]!,
                        statisticItemNumberBorderColors: Colors.grey.shade50,
                        statisticItemNumberColor: AppColors.circleStatisticBlueChart,
                        statisticLineCount: 5,
                        labelHeight: 35,
                        statisticLineColor: Colors.grey.shade300,
                        showBottomStatisticNumber: true,
                        titlePercent: 25,
                        labelPercent: 55,
                        labelCountPercent: 20,
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        } else {
          return CustomOtmContainer(
            child: ShowLoadingWidget(
              title: AppLocalizations.of(context)!.educationForm,
              titleColor: AppColors.professionalDecorativeColor,
            ),
          );
        }
      },
    );
  }
}

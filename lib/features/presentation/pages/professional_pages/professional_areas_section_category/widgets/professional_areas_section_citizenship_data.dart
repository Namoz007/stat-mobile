import 'package:stat_edu_mobile/sources.dart';

class ProfessionalAreasSectionCitizenshipData extends StatelessWidget {
  const ProfessionalAreasSectionCitizenshipData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.areasSectionResponseData.citizenshipData.isNotEmpty) {
          Map<String, List<int>> citizenshipData = {
          AppLocalizations.of(context)!.uzbekCitizen:
                state.areasSectionResponseData.citizenshipData
                    .map((value) => value.countyCitizenshipCount)
                    .toList(),
          AppLocalizations.of(context)!.foreignCitizen:
                state.areasSectionResponseData.citizenshipData
                    .map((value) => value.countyCitizenshipCount)
                    .toList(),
          AppLocalizations.of(context)!.noCitizenship:
                state.areasSectionResponseData.citizenshipData
                    .map((value) => value.countyCitizenshipCount)
                    .toList(),
          AppLocalizations.of(context)!.under18:
                state.areasSectionResponseData.citizenshipData
                    .map((value) => value.countyCitizenshipCount)
                    .toList(),
          };

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(citizenshipData.keys.toList().length, (
              index,
            ) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomOtmContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.citizenship}:${citizenshipData.keys.toList()[index]}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ShowStatisticChart(
                        statisticTitles: state.areasSectionResponseData.citizenshipData.map((value) => value.education_type).toList(),
                        statisticLabelColor: AppColors.circleStatisticBlueChart,
                        statisticItemNumber: citizenshipData[citizenshipData.keys.toList()[index]]!,
                        statisticItemNumberBorderColors: Colors.grey.shade50,
                        statisticItemNumberColor: AppColors.circleStatisticBlueChart,
                        statisticLineCount: 5,
                        labelHeight: 35,
                        statisticLineColor: Colors.grey.shade300,
                        showBottomStatisticNumber: true,
                        titlePercent: 25,
                        labelCountPercent: 20,
                        labelPercent: 55,
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CustomOtmContainer(
              child: ShowLoadingWidget(
                title: AppLocalizations.of(context)!.citizenship,
                titleColor: AppColors.professionalDecorativeColor,
              ),
            ),
          );
        }
      },
    );
  }
}

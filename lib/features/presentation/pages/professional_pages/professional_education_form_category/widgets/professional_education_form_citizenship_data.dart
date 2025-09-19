import 'package:stat_edu_mobile/sources.dart';

class ProfessionalEducationFormCitizenshipData extends StatelessWidget {
  const ProfessionalEducationFormCitizenshipData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.educationFormData.citizenshipData.isNotEmpty) {
          Map<String, List<int>> citizenshipType = {
          AppLocalizations.of(context)!.uzbekCitizen:
                state.educationFormData.citizenshipData
                    .map((value) => value.countyCitizenshipCount)
                    .toList(),
          AppLocalizations.of(context)!.foreignCitizen:
                state.educationFormData.citizenshipData
                    .map((value) => value.foreignCitizenshipCount)
                    .toList(),
          AppLocalizations.of(context)!.noCitizenship:
                state.educationFormData.citizenshipData
                    .map((value) => value.notCitizenshipCount)
                    .toList(),
          AppLocalizations.of(context)!.under18:
                state.educationFormData.citizenshipData
                    .map((value) => value.minorCount)
                    .toList(),
          };
          return Column(
            children: List.generate(citizenshipType.keys.toList().length, (
              index,
            ) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomOtmContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.citizenship}-${citizenshipType.keys.toList()[index]}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ShowStatisticChart(
                        statisticTitles: state.educationFormData.citizenshipData.map((value) => value.education_type).toList(),
                        statisticLabelColor: AppColors.circleStatisticBlueChart,
                        statisticItemNumber: citizenshipType.values.toList()[index],
                        statisticItemNumberBorderColors: Colors.grey.shade50,
                        statisticItemNumberColor: AppColors.circleStatisticBlueChart,
                        statisticLineCount: 5,
                        labelHeight: 30,
                        statisticLineColor: Colors.grey.shade300,
                        showBottomStatisticNumber: true,
                        titlePercent: 20,
                        labelCountPercent: 20,
                        labelPercent: 60,
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
                title: "Fuqaroligi",
                titleColor: AppColors.professionalDecorativeColor,
              ),
            ),
          );
        }
      },
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class ProfessionalEducationFormResidenceData extends StatelessWidget {
  const ProfessionalEducationFormResidenceData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.educationFormData.residenceData.isNotEmpty) {
          Map<String, List<int>> residenceData = {
          AppLocalizations.of(context)!.ownHouse:
                state.educationFormData.residenceData
                    .map((value) => value.houseLiveCount)
                    .toList(),
          AppLocalizations.of(context)!.dormitory:
                state.educationFormData.residenceData
                    .map((value) => value.studentsHouseLiveCount)
                    .toList(),
          AppLocalizations.of(context)!.rentedHouse:
                state.educationFormData.residenceData
                    .map((value) => value.rentalHouseLiveCount)
                    .toList(),
          AppLocalizations.of(context)!.relativeHouse:
                state.educationFormData.residenceData
                    .map((value) => value.relativeHouseLiveCount)
                    .toList(),
          AppLocalizations.of(context)!.friendHouse:
                state.educationFormData.residenceData
                    .map((value) => value.familiarHouseLiveCount)
                    .toList(),
          AppLocalizations.of(context)!.other:
                state.educationFormData.residenceData
                    .map((value) => value.otherLiveCount)
                    .toList(),
          };
          return Column(
            children: List.generate(residenceData.keys.toList().length, (
              index,
            ) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomOtmContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.residenceRegion}-${residenceData.keys.toList()[index]}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ShowStatisticChart(
                        statisticTitles: state.educationFormData.residenceData.map((value) => value.education_type).toList(),
                        statisticLabelColor: AppColors.circleStatisticBlueChart,
                        statisticItemNumber: residenceData.values.toList()[index],
                        statisticItemNumberBorderColors: Colors.grey.shade50,
                        statisticItemNumberColor: AppColors.circleStatisticBlueChart,
                        statisticLineCount: 5,
                        labelHeight: 30,
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
              title: AppLocalizations.of(context)!.residenceRegion,
              titleColor: AppColors.professionalDecorativeColor,
            ),
          );
        }
      },
    );
  }
}

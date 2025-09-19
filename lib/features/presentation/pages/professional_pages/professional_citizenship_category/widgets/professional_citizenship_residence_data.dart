import 'package:stat_edu_mobile/sources.dart';

class ProfessionalCitizenshipResidenceData extends StatelessWidget {
  const ProfessionalCitizenshipResidenceData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.citizenshipResponseData.residenceData.isNotEmpty) {
          Map<String, List<int>> residenceData = {
          AppLocalizations.of(context)!.ownHouse:
                state.citizenshipResponseData.residenceData
                    .map((value) => value.houseLiveCount)
                    .toList(),
          AppLocalizations.of(context)!.dormitory:
                state.citizenshipResponseData.residenceData
                    .map((value) => value.studentsHouseLiveCount)
                    .toList(),
          AppLocalizations.of(context)!.rentedHouse:
                state.citizenshipResponseData.residenceData
                    .map((value) => value.rentalHouseLiveCount)
                    .toList(),
          AppLocalizations.of(context)!.relativeHouse:
                state.citizenshipResponseData.residenceData
                    .map((value) => value.relativeHouseLiveCount)
                    .toList(),
          AppLocalizations.of(context)!.friendHouse:
                state.citizenshipResponseData.residenceData
                    .map((value) => value.familiarHouseLiveCount)
                    .toList(),
          AppLocalizations.of(context)!.other:
                state.citizenshipResponseData.residenceData
                    .map((value) => value.otherLiveCount)
                    .toList(),
          };
          return Column(
            children: List.generate(residenceData.length, (index){
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
                        statisticTitles: state.citizenshipResponseData.residenceData.map((value) => value.education_type).toList(),
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
              title: "Yashash joyi",
              titleColor: AppColors.professionalDecorativeColor,
            ),
          );
        }
      },
    );
  }
}

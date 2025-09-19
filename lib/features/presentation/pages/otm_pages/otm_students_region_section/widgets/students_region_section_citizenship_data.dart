import 'package:stat_edu_mobile/sources.dart';

class StudentsRegionSectionCitizenshipData extends StatefulWidget {
  const StudentsRegionSectionCitizenshipData({super.key});

  @override
  State<StudentsRegionSectionCitizenshipData> createState() =>
      _StudentsRegionSectionCitizenshipDataState();
}

class _StudentsRegionSectionCitizenshipDataState
    extends State<StudentsRegionSectionCitizenshipData> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsRegionSectionBloc>().add(
      GetCitizenshipStudentsRegionSectionEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsRegionSectionBloc, StudentsRegionSectionState>(
      builder: (context, state) {


        if (state.studentsCitizenshipData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              state.studentsCitizenshipData
                  .map((value) => value.region)
                  .toSet()
                  .toList()
                  .length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CustomOtmContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${AppLocalizations.of(context)!.citizenship}:${getTranslateWord(context: context, value: state.studentsCitizenshipData.map((value) => value.region).toSet().toList()[index])}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ShowStatisticChart(
                          statisticTitles: state.studentsCitizenshipData.where((value) => value.region == state.studentsCitizenshipData.map((value) => value.region).toSet().toList()[index]).toList().map((value) => value.name).toSet().toList(),
                          statisticLabelColor: AppColors.blueCircleChartColor,
                          statisticItemNumber: [
                            for(var i in state.studentsCitizenshipData.where((value) => value.region == state.studentsCitizenshipData.map((value) => value.region).toSet().toList()[index]).toList().map((value) => value.name).toSet().toList())
                              for(var z in state.studentsCitizenshipData)
                                if(i == z.name && z.region == state.studentsCitizenshipData.map((value) => value.region).toSet().toList()[index])
                                  z.count
                          ],
                          statisticItemNumberBorderColors: Colors.grey.shade50,
                          statisticItemNumberColor: AppColors.circleStatisticBlueChart,
                          statisticLineCount: 5,
                          labelHeight: 30,
                          statisticLineColor: Colors.grey.shade300,
                          showBottomStatisticNumber: true,
                          labelPercent: 55,
                          labelCountPercent: 20,
                          titlePercent: 25,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomOtmContainer(child: ShowLoadingWidget(title: AppLocalizations.of(context)!.citizenship, titleColor: AppColors.otmStudentsPageDecorativeColor)),
          );
        }
      },
    );
  }
}

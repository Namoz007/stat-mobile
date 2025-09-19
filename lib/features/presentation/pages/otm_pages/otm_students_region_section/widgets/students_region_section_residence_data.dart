import 'package:stat_edu_mobile/sources.dart';

class StudentsRegionSectionResidenceData extends StatefulWidget {
  const StudentsRegionSectionResidenceData({super.key});

  @override
  State<StudentsRegionSectionResidenceData> createState() =>
      _StudentsRegionSectionResidenceDataState();
}

class _StudentsRegionSectionResidenceDataState
    extends State<StudentsRegionSectionResidenceData> {
  
  @override
  void initState() {
    super.initState();
    context.read<StudentsRegionSectionBloc>().add(GetResidenceStudentsRegionSectionEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsRegionSectionBloc, StudentsRegionSectionState>(
      builder: (context, state) {

        if (state.studentsResidenceData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              state.studentsResidenceData
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
                          "${AppLocalizations.of(context)!.residenceRegion}:${getTranslateWord(context: context, value: state.studentsResidenceData.map((value) => value.region).toSet().toList()[index])}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ShowStatisticChart(
                          statisticTitles: state.studentsResidenceData.where((value) => value.region == state.studentsResidenceData.map((value) => value.region).toSet().toList()[index]).toList().map((value) => value.name).toSet().toList(),
                          statisticLabelColor: AppColors.circleStatisticBlueChart,
                          statisticItemNumber: [
                            for(var i in state.studentsResidenceData.where((value) => value.region == state.studentsResidenceData.map((value) => value.region).toSet().toList()[index]).toList().map((value) => value.name).toSet().toList())
                              for(var z in state.studentsResidenceData)
                                if(i == z.name && z.region == state.studentsResidenceData.map((value) => value.region).toSet().toList()[index])
                                  z.count
                          ],
                          statisticItemNumberBorderColors: Colors.grey.shade50,
                          statisticItemNumberColor: AppColors.circleStatisticBlueChart,
                          statisticLineCount: 5,
                          labelHeight: 30,
                          statisticLineColor: Colors.grey.shade300,
                          showBottomStatisticNumber: true,
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
            child: CustomOtmContainer(child: ShowLoadingWidget(title: AppLocalizations.of(context)!.residenceRegion, titleColor: AppColors.otmStudentsPageDecorativeColor)),
          );
        }
      },
    );
  }
}

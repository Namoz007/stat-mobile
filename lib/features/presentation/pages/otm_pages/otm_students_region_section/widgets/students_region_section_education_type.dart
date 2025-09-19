import 'package:stat_edu_mobile/sources.dart';

class StudentsRegionSectionEducationType extends StatefulWidget {
  const StudentsRegionSectionEducationType({super.key});

  @override
  State<StudentsRegionSectionEducationType> createState() =>
      _StudentsRegionSectionEducationTypeState();
}

class _StudentsRegionSectionEducationTypeState
    extends State<StudentsRegionSectionEducationType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsRegionSectionBloc>().add(
      GetEducationTypeStudentsRegionSectionEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsRegionSectionBloc, StudentsRegionSectionState>(
      builder: (context, state) {


        if (state.studentsEducationTypeData.isNotEmpty) {
          Map<String, Color> educationTypeData = {};
          state.studentsEducationTypeData
              .map((value) => value.name)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) =>
                    educationTypeData[value] = AppColors.allColors[key],
              );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              state.studentsEducationTypeData
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
                          "${AppLocalizations.of(context)!.educationType}:${getTranslateWord(context: context, value: state.studentsEducationTypeData.map((value) => value.region).toSet().toList()[index])}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ShowMultiStatisticChart(
                          statisticTitles: state.studentsEducationTypeData.where((value) => value.region == state.studentsEducationTypeData.map((value) => value.region).toSet().toList()[index]).toList().map((value) => value.name).toSet().toList(),
                          statisticLabelColor: [
                            for(var i in state.studentsEducationTypeData.where((value) => value.region == state.studentsEducationTypeData.map((value) => value.region).toSet().toList()[index]).toList().map((value) => value.name).toSet().toList())
                              [
                                for(var z in state.studentsEducationTypeData)
                                  if(i == z.name && z.region == state.studentsEducationTypeData.map((value) => value.region).toSet().toList()[index])
                                    educationTypeData[z.name]!
                              ]
                          ],
                          statisticItemNumber: [
                            for(var i in state.studentsEducationTypeData.where((value) => value.region == state.studentsEducationTypeData.map((value) => value.region).toSet().toList()[index]).toList().map((value) => value.name).toSet().toList())
                              [
                                for(var z in state.studentsEducationTypeData)
                                  if(i == z.name && z.region == state.studentsEducationTypeData.map((value) => value.region).toSet().toList()[index])
                                    z.count
                              ]
                          ],
                          statisticItemNumberBorderColors: [],
                          statisticItemNumberColor: [
                            for(var i in state.studentsEducationTypeData.where((value) => value.region == state.studentsEducationTypeData.map((value) => value.region).toSet().toList()[index]).toList().map((value) => value.name).toSet().toList())
                              [
                                for(var z in state.studentsEducationTypeData)
                                  if(i == z.name && z.region == state.studentsEducationTypeData.map((value) => value.region).toSet().toList()[index])
                                    educationTypeData[z.name]!
                              ]
                          ],
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
              },
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CustomOtmContainer(child: ShowLoadingWidget(title: AppLocalizations.of(context)!.educationType, titleColor: AppColors.otmStudentsPageDecorativeColor)),
          );
        }
      },
    );
  }
}

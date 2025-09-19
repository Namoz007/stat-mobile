import 'package:stat_edu_mobile/sources.dart';

class StudentsRegionSectionAgeData extends StatefulWidget {
  const StudentsRegionSectionAgeData({super.key});

  @override
  State<StudentsRegionSectionAgeData> createState() =>
      _StudentsRegionSectionAgeDataState();
}

class _StudentsRegionSectionAgeDataState
    extends State<StudentsRegionSectionAgeData> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsRegionSectionBloc>().add(
      GetAgeStudentsRegionSectionEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsRegionSectionBloc, StudentsRegionSectionState>(
      builder: (context, state) {

        if(state.loading || state.studentsAgeData.isEmpty){
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.age, titleColor: AppColors.otmStudentsPageDecorativeColor);
        }

        if (state.studentsAgeData.isNotEmpty) {
          Map<String, Color> ageData = {};
          state.studentsAgeData
              .map((value) => value.name)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) => ageData[value] = AppColors.allColors[key],
              );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.age,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.otmStudentsPageDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles:
                    state.studentsAgeData
                        .map((value) => value.region)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsAgeData
                          .map((value) => value.region)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsAgeData)
                        if (i == z.region) ageData[z.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsAgeData
                          .map((value) => value.region)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsAgeData)
                        if (i == z.region) z.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsAgeData
                          .map((value) => value.region)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsAgeData)
                        if (i == z.region) ageData[z.name]!,
                    ],
                ],
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelPercent: 60,
                labelCountPercent: 20,
              ),
              ShowRectangleTitle(
                title:
                    ageData.keys
                        .toList()
                        .map((value) => getTranslateWord(context: context, value: formatAgeWithKey(value)) ?? value)
                        .toList(),
                colors: ageData.values.toList(),
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
              const SizedBox(height: 10,),
            ],
          );
        } else {
          return Text("Ma'lumotlar topilmadi!");
        }
      },
    );
  }
}

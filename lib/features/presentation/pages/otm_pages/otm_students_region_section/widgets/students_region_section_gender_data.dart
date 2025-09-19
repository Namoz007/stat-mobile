import 'package:stat_edu_mobile/sources.dart';

class StudentsRegionSectionGenderData extends StatefulWidget {
  const StudentsRegionSectionGenderData({super.key});

  @override
  State<StudentsRegionSectionGenderData> createState() =>
      _StudentsRegionSectionGenderDataState();
}

class _StudentsRegionSectionGenderDataState
    extends State<StudentsRegionSectionGenderData> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsRegionSectionBloc>().add(
      GetGenderStudentsRegionSectionEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsRegionSectionBloc, StudentsRegionSectionState>(
      builder: (context, state) {

        if(state.loading || state.studentsGenderData.isEmpty){
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.byGender, titleColor: AppColors.otmStudentsPageDecorativeColor);
        }

        if (state.studentsGenderData.isNotEmpty) {
          Map<String, Color> genderData = {};
          state.studentsGenderData
              .map((value) => value.name)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) => genderData[value] = AppColors.colors1[key],
              );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.byGender,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.otmStudentsPageDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(genderData.keys.toList().length, (
                  index,
                ) {
                  return Column(
                    children: [
                      Text(
                        getTranslateWord(context: context, value: genderData.keys.toList()[index]),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state.studentsGenderData
                              .where(
                                (value) =>
                                    value.name ==
                                    genderData.keys.toList()[index],
                              )
                              .toList()
                              .map((value) => value.count)
                              .toList()
                              .reduce((a, b) => a + b),
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.otmStudentsPageDecorativeColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  );
                }),
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles:
                    state.studentsGenderData
                        .map((value) => value.region)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsGenderData
                          .map((value) => value.region)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsGenderData)
                        if (i == z.region) genderData[z.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsGenderData
                          .map((value) => value.region)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsGenderData)
                        if (i == z.region) z.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsGenderData
                          .map((value) => value.region)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsGenderData)
                        if (i == z.region) genderData[z.name]!,
                    ],
                ],
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 25,
                labelPercent: 55,
                labelCountPercent: 20,
              ),
              ShowRectangleTitle(
                title: genderData.keys.map((value) => getTranslateWord(context: context, value: value)).toList(),
                colors: genderData.values.toList(),
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return Center(child: Text("Ma'lumotlar topilmadi!"));
        }
      },
    );
  }
}

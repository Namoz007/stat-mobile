import 'package:stat_edu_mobile/sources.dart';

class StudentsAgeGenderData extends StatefulWidget {
  const StudentsAgeGenderData({super.key});

  @override
  State<StudentsAgeGenderData> createState() => _StudentsAgeGenderDataState();
}

class _StudentsAgeGenderDataState extends State<StudentsAgeGenderData> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsAgeResidenceBloc>().add(
      GetGenderStudentsAgeResidenceEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsAgeResidenceBloc, StudentsAgeResidenceState>(
      builder: (context, state) {

        if(state.studentsGenderData.isEmpty || state.loading){
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
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
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.otmStudentsPageDecorativeColor,
                        ),
                      ),
                    ],
                  );
                }),
              ),
              ShowMultiStatisticChart(
                statisticTitles:
                    state.studentsGenderData
                        .map((value) => formatAgeWithKey(value.eduType))
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsGenderData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsGenderData)
                        if (i == z.eduType) genderData[z.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsGenderData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsGenderData)
                        if (i == z.eduType) z.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsGenderData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsGenderData)
                        if (i == z.eduType) genderData[z.name]!,
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
                title: genderData.keys.map((value) => getTranslateWord(context: context, value: value)).toList(),
                colors: genderData.values.toList(),
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
              const SizedBox(height: 12),
            ],

          );
        } else {
          return Center(child: Text("Ma'lumotlar topilmadi!"));
        }
      },
    );
  }
}

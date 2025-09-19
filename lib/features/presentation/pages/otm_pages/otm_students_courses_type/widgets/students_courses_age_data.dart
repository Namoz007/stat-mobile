import 'package:stat_edu_mobile/sources.dart';

class StudentsCoursesAgeData extends StatefulWidget {
  const StudentsCoursesAgeData({super.key});

  @override
  State<StudentsCoursesAgeData> createState() => _StudentsCoursesAgeDataState();
}

class _StudentsCoursesAgeDataState extends State<StudentsCoursesAgeData> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsCoursesBloc>().add(
      GetAgeStudentsCourseEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsCoursesBloc, StudentsCoursesState>(
      builder: (context, state) {

        if (state.studentsByAge.isNotEmpty) {
          Map<String, Color> ageData = {};
          state.studentsByAge
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
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.otmStudentsPageDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(ageData.keys.toList().length, (index) {
                  return Column(
                    children: [
                      Text(
                        getTranslateWord(context: context, value: formatAgeWithKey(ageData.keys.toList()[index])),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state.studentsByAge
                              .where(
                                (value) =>
                                    value.name == ageData.keys.toList()[index],
                              )
                              .toList()
                              .map((value) => value.count)
                              .toList()
                              .reduce((a, b) => a + b),
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.otmStudentsPageDecorativeColor,
                        ),
                      ),
                    ],
                  );
                }),
              ),
              ShowMultiStatisticChart(
                statisticTitles:
                    state.studentsByAge
                        .map((value) => value.eduType)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsByAge
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsByAge)
                        if (i == z.eduType) ageData[z.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsByAge
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsByAge)
                        if (i == z.eduType) z.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsByAge
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsByAge)
                        if (i == z.eduType) ageData[z.name]!,
                    ],
                ],
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
              ),
              ShowRectangleTitle(
                title: ageData.keys.toList().map((value) => getTranslateWord(context: context, value: formatAgeWithKey(value))).toList(),
                colors: ageData.values.toList(),
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.age, titleColor: AppColors.otmStudentsPageDecorativeColor);
        }
      },
    );
  }
}

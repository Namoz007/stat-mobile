import 'package:stat_edu_mobile/sources.dart';

class StudentsCoursesGenderData extends StatefulWidget {
  const StudentsCoursesGenderData({super.key});

  @override
  State<StudentsCoursesGenderData> createState() =>
      _StudentsCoursesGenderDataState();
}

class _StudentsCoursesGenderDataState extends State<StudentsCoursesGenderData> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsCoursesBloc>().add(
      GetGenderStudentsCourseEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsCoursesBloc, StudentsCoursesState>(
      builder: (context, state) {

        if (state.studentsByGender.isNotEmpty) {
          Map<String, Color> genderData = {};
          state.studentsByGender
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
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state.studentsByGender
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
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles:
                    state.studentsByGender
                        .map((value) => value.eduType)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsByGender
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsByGender)
                        if (i == z.eduType) genderData[z.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsByGender
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsByGender)
                        if (i == z.eduType) z.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsByGender
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsByGender)
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
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.byGender, titleColor: AppColors.otmStudentsPageDecorativeColor,);
        }
      },
    );
  }
}

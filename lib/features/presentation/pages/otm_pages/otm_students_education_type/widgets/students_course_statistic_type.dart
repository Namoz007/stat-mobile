import 'package:stat_edu_mobile/sources.dart';

class StudentsCourseStatisticType extends StatefulWidget {
  const StudentsCourseStatisticType({super.key});

  @override
  State<StudentsCourseStatisticType> createState() =>
      _StudentsCourseStatisticTypeState();
}

class _StudentsCourseStatisticTypeState
    extends State<StudentsCourseStatisticType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsControllerBloc>().add(
      GetStudentsCoursesStatisticStudentsControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsControllerBloc, StudentsControllerState>(
      builder: (context, state) {
        if (state.studentsCoursesStatisticData.isNotEmpty) {
          Map<String, Color> coursesData = {};
          state.studentsCoursesStatisticData
              .map((value) => value.name)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) => coursesData[value] = AppColors.allColors[key],
              );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.courses,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.otmStudentsPageDecorativeColor,
                ),
              ),
              const SizedBox(height: 14),
              ShowMultiStatisticChart(
                statisticTitles:
                    state.studentsCoursesStatisticData
                        .map((value) => value.eduType)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsCoursesStatisticData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsCoursesStatisticData)
                        if (i == v.eduType) coursesData[v.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsCoursesStatisticData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsCoursesStatisticData)
                        if (i == v.eduType) v.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsCoursesStatisticData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsCoursesStatisticData)
                        if (i == v.eduType) coursesData[v.name]!,
                    ],
                ],
                statisticLineCount: 5,
                labelHeight: 25,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelPercent: 60,
                labelCountPercent: 20,
              ),
              ShowRectangleTitle(
                title: coursesData.keys.map((value) => getTranslateWord(context: context, value: value)).toList(),
                colors: coursesData.values.toList(),
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
              const SizedBox(height: 12),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: AppLocalizations.of(context)!.courses,
            titleColor: AppColors.otmStudentsPageDecorativeColor,
          );
        }
      },
    );
  }
}

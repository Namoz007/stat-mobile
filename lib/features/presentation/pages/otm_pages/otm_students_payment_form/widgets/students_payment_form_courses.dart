import 'package:stat_edu_mobile/sources.dart';

class StudentsPaymentFormCourses extends StatefulWidget {
  const StudentsPaymentFormCourses({super.key});

  @override
  State<StudentsPaymentFormCourses> createState() =>
      _StudentsPaymentFormCoursesState();
}

class _StudentsPaymentFormCoursesState
    extends State<StudentsPaymentFormCourses> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsPaymentFormBloc>().add(
      GetCoursesStudentsPaymentFormEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsPaymentFormBloc, StudentsPaymentFormState>(
      builder: (context, state) {

        if (state.studentsCoursesData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              state.studentsCoursesData
                  .map((value) => value.eduType)
                  .toSet()
                  .toList()
                  .length,
              (index) {
                Map<String, Color> courses = {};
                state.studentsCoursesData
                    .where(
                      (value) =>
                          value.eduType ==
                          state.studentsCoursesData
                              .map((value) => value.eduType)
                              .toSet()
                              .toList()[index],
                    )
                    .toList()
                    .map((value) => value.name)
                    .toSet()
                    .toList()
                    .asMap()
                    .forEach(
                      (key, value) => courses[value] = AppColors.allColors[key],
                    );
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CustomOtmContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${AppLocalizations.of(context)!.courses}: ${state.studentsCoursesData.map((value) => value.eduType).toSet().toList()[index]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ShowMultiStatisticChart(
                          statisticTitles: courses.keys.toList(),
                          statisticLabelColor: [
                            for (var i in courses.keys.toList())
                              [
                                for (var v in state.studentsCoursesData)
                                  if (i == v.name &&
                                      state.studentsCoursesData
                                              .map((value) => value.eduType)
                                              .toSet()
                                              .toList()[index] ==
                                          v.eduType)
                                    courses[v.name]!,
                              ],
                          ],
                          statisticItemNumber: [
                            for (var i in courses.keys.toList())
                              [
                                for (var v in state.studentsCoursesData)
                                  if (i == v.name &&
                                      state.studentsCoursesData
                                              .map((value) => value.eduType)
                                              .toSet()
                                              .toList()[index] ==
                                          v.eduType)
                                    v.count,
                              ],
                          ],
                          statisticItemNumberBorderColors: [],
                          statisticItemNumberColor: [
                            for (var i in courses.keys.toList())
                              [
                                for (var v in state.studentsCoursesData)
                                  if (i == v.name &&
                                      state.studentsCoursesData
                                              .map((value) => value.eduType)
                                              .toSet()
                                              .toList()[index] ==
                                          v.eduType)
                                    courses[v.name]!,
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
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return CustomOtmContainer(child: ShowLoadingWidget(title: AppLocalizations.of(context)!.courses, titleColor: AppColors.otmStudentsPageDecorativeColor,));
        }
      },
    );
  }
}

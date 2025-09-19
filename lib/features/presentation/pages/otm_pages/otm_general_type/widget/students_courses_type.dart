import 'package:stat_edu_mobile/sources.dart';

class StudentsCoursesType extends StatefulWidget {
  const StudentsCoursesType({super.key});

  @override
  State<StudentsCoursesType> createState() => _StudentsCoursesTypeState();
}

class _StudentsCoursesTypeState extends State<StudentsCoursesType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsControllerBloc>().add(
      GetOTMCourseStudentsControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OtmCategoryControllerCubit>(),
      child: BlocBuilder<StudentsControllerBloc, StudentsControllerState>(
        builder: (context, state) {
          if (state.studentsOTMCourses.isNotEmpty) {
            context.read<OtmCategoryControllerCubit>().newCategories([
              "Jami",
              ...state.studentsOTMCourses.map((value) => value.ownership),
            ]);
            context.read<OtmCategoryControllerCubit>().newPages(
              [
                    "Jami",
                    ...state.studentsOTMCourses.map((value) => value.ownership),
                  ]
                  .map(
                    (value) =>
                        value == 'Jami'
                            ? ShowStatisticChart(
                              statisticTitles: [
                                "1-kurs",
                                "2-kurs",
                                "3-kurs",
                                "4-kurs",
                                "5-kurs",
                                "6-kurs",
                              ],
                              statisticLabelColor:
                                  AppColors.lightGreenChartColor,
                              statisticItemNumber: [
                                state.studentsOTMCourses
                                    .map((value) => value.course1Count)
                                    .toList()
                                    .reduce((a, b) => a + b),
                                state.studentsOTMCourses
                                    .map((value) => value.course2Count)
                                    .toList()
                                    .reduce((a, b) => a + b),
                                state.studentsOTMCourses
                                    .map((value) => value.course3Count)
                                    .toList()
                                    .reduce((a, b) => a + b),
                                state.studentsOTMCourses
                                    .map((value) => value.course4Count)
                                    .toList()
                                    .reduce((a, b) => a + b),
                                state.studentsOTMCourses
                                    .map((value) => value.course5Count)
                                    .toList()
                                    .reduce((a, b) => a + b),
                                state.studentsOTMCourses
                                    .map((value) => value.course6Count)
                                    .toList()
                                    .reduce((a, b) => a + b),
                              ],
                              statisticItemNumberBorderColors:
                                  Colors.grey.shade50,
                              statisticItemNumberColor:
                                  AppColors.lightGreenChartColor,
                              statisticLineCount: 5,
                              labelHeight: 30,
                              statisticLineColor: Colors.grey.shade300,
                              showBottomStatisticNumber: false,
                              titlePercent: 25,
                              labelPercent: 55,
                              labelCountPercent: 20,
                            )
                            : ShowStatisticChart(
                              statisticTitles: [
                                "1-kurs",
                                "2-kurs",
                                "3-kurs",
                                "4-kurs",
                                "5-kurs",
                                "6-kurs",
                              ],
                              statisticLabelColor:
                                  AppColors.lightGreenChartColor,
                              statisticItemNumber: [
                                state.studentsOTMCourses
                                    .where((v) => v.ownership == value)
                                    .toList()
                                    .map((v) => v.course1Count)
                                    .toList()
                                    .reduce((a, b) => a + b),
                                state.studentsOTMCourses
                                    .where((v) => v.ownership == value)
                                    .toList()
                                    .map((v) => v.course2Count)
                                    .toList()
                                    .reduce((a, b) => a + b),
                                state.studentsOTMCourses
                                    .where((v) => v.ownership == value)
                                    .toList()
                                    .map((v) => v.course3Count)
                                    .toList()
                                    .reduce((a, b) => a + b),
                                state.studentsOTMCourses
                                    .where((v) => v.ownership == value)
                                    .toList()
                                    .map((v) => v.course4Count)
                                    .toList()
                                    .reduce((a, b) => a + b),
                                state.studentsOTMCourses
                                    .where((v) => v.ownership == value)
                                    .toList()
                                    .map((v) => v.course5Count)
                                    .toList()
                                    .reduce((a, b) => a + b),
                                state.studentsOTMCourses
                                    .where((v) => v.ownership == value)
                                    .toList()
                                    .map((v) => v.course6Count)
                                    .toList()
                                    .reduce((a, b) => a + b),
                              ],
                              statisticItemNumberBorderColors:
                                  Colors.grey.shade50,
                              statisticItemNumberColor:
                                  AppColors.lightGreenChartColor,
                              statisticLineCount: 5,
                              labelHeight: 30,
                              statisticLineColor: Colors.grey.shade300,
                              showBottomStatisticNumber: false,
                              titlePercent: 25,
                              labelPercent: 55,
                              labelCountPercent: 20,
                            ),
                  )
                  .toList(),
            );
            return BlocBuilder<
              OtmCategoryControllerCubit,
              OtmCategoryControllerState
            >(
              builder: (context, st) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.numberOfStudentsByCourse,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.decorativeColor,
                      ),
                    ),
                    const SizedBox(height: 13),
                    SelectCategoryByKey(
                      title: st.categories[st.index],
                      rightOnTap: () {
                        if (st.categories.length - 1 != st.index) {
                          context.read<OtmCategoryControllerCubit>().newIndex(
                            index: st.index + 1,
                          );
                        }
                      },
                      leftOnTap: () {
                        if (st.index != 0) {
                          context.read<OtmCategoryControllerCubit>().newIndex(
                            index: st.index - 1,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    st.pages[st.index],
                  ],
                );
              },
            );
          } else {
            return ShowLoadingWidget(
              title: "Talabalar soni kurs kesimida",
              titleColor: Colors.black,
            );
          }
        },
      ),
    );
  }
}

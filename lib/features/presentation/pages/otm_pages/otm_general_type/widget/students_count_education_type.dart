import 'package:stat_edu_mobile/sources.dart';

class StudentsCountEducationType extends StatefulWidget {
  const StudentsCountEducationType({super.key});

  @override
  State<StudentsCountEducationType> createState() =>
      _StudentsCountEducationTypeState();
}

class _StudentsCountEducationTypeState
    extends State<StudentsCountEducationType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsControllerBloc>().add(
      GetEducationCountStudentsControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OtmCategoryControllerCubit>(),
      child: BlocBuilder<StudentsControllerBloc, StudentsControllerState>(
        builder: (context, state) {
          if (state.studentsStatisticEducation.isNotEmpty) {
            context.read<OtmCategoryControllerCubit>().newCategories(
              [
                AppLocalizations.of(context)!.overall,
                ...state.studentsStatisticEducation.map(
                  (value) => value.ownership,
                ),
              ],
            );
            context.read<OtmCategoryControllerCubit>().newPages(
              [
                AppLocalizations.of(context)!.overall,
                    ...state.studentsStatisticEducation.map(
                      (value) => value.ownership,
                    ),

                  ]
                  .map(
                    (value) =>
                        value == AppLocalizations.of(context)!.overall
                            ? ShowStatisticChart(
                                                      statisticTitles: [
                                                        AppLocalizations.of(context)!.bachelor,
                                                        AppLocalizations.of(context)!.masters,
                                                        AppLocalizations.of(context)!.ordinatura,
                                                      ],
                                                      statisticLabelColor: AppColors.lightGreenChartColor,
                                                      statisticItemNumber: [
                            state.studentsStatisticEducation.map((v) => v.bachelorCount).toList().reduce((a, b) => a + b),
                            state.studentsStatisticEducation.map((v) => v.masterDegreeCount).toList().reduce((a, b) => a + b),
                            state.studentsStatisticEducation.map((v) => v.residencyCount).toList().reduce((a, b) => a + b),
                                                      ],
                                                      statisticItemNumberBorderColors:
                                                      Colors.grey.shade50,
                                                      statisticItemNumberColor:
                                                      AppColors.lightGreenChartColor,
                                                      statisticLineCount: 5,
                                                      labelHeight: 53,
                                                      statisticLineColor: Colors.grey.shade300,
                                                      showBottomStatisticNumber: false,
                                                      titlePercent: 25,
                                                      labelCountPercent: 20,
                                                      labelPercent: 55,
                                                    )
                            : ShowStatisticChart(
                              statisticTitles: [
                                "Bakalavr",
                                "Magistratura",
                                "Ordinatura",
                              ],
                              statisticLabelColor:
                                  AppColors.lightGreenChartColor,
                              statisticItemNumber: [
                                state.studentsStatisticEducation
                                    .where((v) => v.ownership == value)
                                    .toList()
                                    .map((value) => value.bachelorCount)
                                    .toList()
                                    .reduce((a, b) => a + b),
                                state.studentsStatisticEducation
                                    .where((v) => v.ownership == value)
                                    .toList()
                                    .map((value) => value.masterDegreeCount)
                                    .toList()
                                    .reduce((a, b) => a + b),
                                state.studentsStatisticEducation
                                    .where((v) => v.ownership == value)
                                    .toList()
                                    .map((value) => value.residencyCount)
                                    .toList()
                                    .reduce((a, b) => a + b),
                              ],
                              statisticItemNumberBorderColors:
                                  Colors.grey.shade50,
                              statisticItemNumberColor:
                                  AppColors.lightGreenChartColor,
                              statisticLineCount: 5,
                              labelHeight: 53,
                              statisticLineColor: Colors.grey.shade300,
                              showBottomStatisticNumber: false,
                          labelCountPercent: 20,
                          labelPercent: 55,
                          titlePercent: 25,
                            ),
                  )
                  .toList(),
            );
            return BlocBuilder<
              OtmCategoryControllerCubit,
              OtmCategoryControllerState
            >(
              builder: (context, st) {
                //
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.numberOfStudentsByEducationType,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 13),
                    SelectCategoryByKey(
                      title: st.categories[st.index],
                      rightOnTap: () {
                        if (st.categories.length - 1 != st.index) {
                          context.read<OtmCategoryControllerCubit>().newIndex(
                            index:st.index + 1,
                          );
                        }
                      },
                      leftOnTap: () {
                        if (st.index != 0) {
                          context.read<OtmCategoryControllerCubit>().newIndex(
                            index:st.index - 1,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 0,
                      width: 0,
                      child: PageView(
                        controller: st.controller,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                    ),
                    st.pages[st.index],
                  ],
                );
              },
            );
          } else {
            return ShowLoadingWidget(
              title: "Talabalar soni ta'lim turi kesimida",
              titleColor: Colors.black,
            );
          }
        },
      ),
    );
  }
}

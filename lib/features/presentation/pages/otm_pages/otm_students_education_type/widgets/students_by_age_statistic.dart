import 'package:stat_edu_mobile/sources.dart';

class StudentsByAgeStatistic extends StatefulWidget {
  const StudentsByAgeStatistic({super.key});

  @override
  State<StudentsByAgeStatistic> createState() => _StudentsByAgeStatisticState();
}

class _StudentsByAgeStatisticState extends State<StudentsByAgeStatistic> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsControllerBloc>().add(
      GetStatisticAgeDataStudentsControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsControllerBloc, StudentsControllerState>(
      builder: (context, state) {
        if (state.studentsByAgeStatisticData.isNotEmpty) {
          Map<String, Color> ageData = {};
          state.studentsByAgeStatisticData.map((value) => value.name).toSet().toList().asMap().forEach((key, value) => ageData[value] = AppColors.colors1[key]);
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
              const SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  state.studentsByAgeStatisticData.map((value) => value.name).toSet().toList().length,
                  (index) {
                    return Column(
                      children: [
                        Text(
                          getTranslateWord(context: context, value: formatAgeWithKey(
                            state.studentsByAgeStatisticData
                                .map((value) => value.name)
                                .toSet()
                                .toList()[index],
                          ),),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ),
                        Text(
                          formatNumber(
                            state.studentsByAgeStatisticData
                                .where(
                                  (value) =>
                                      value.name ==
                                      state.studentsByAgeStatisticData
                                          .map((value) => value.name)
                                          .toSet()
                                          .toList()[index],
                                )
                                .toList()
                                .map((value) => value.count)
                                .toList()
                                .reduce((a, b) => a + b),
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles:
                    state.studentsByAgeStatisticData
                        .map((value) => value.eduType)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsByAgeStatisticData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsByAgeStatisticData)
                        if (i == v.eduType) ageData[v.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsByAgeStatisticData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsByAgeStatisticData)
                        if (i == v.eduType) v.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsByAgeStatisticData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsByAgeStatisticData)
                        if (i == v.eduType) ageData[v.name]!,
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
              const SizedBox(height: 10),
              ShowRectangleTitle(
                title: ageData.keys.toList().map((value) => getTranslateWord(context: context, value: formatAgeWithKey(value))).toList(),
                colors: ageData.values.toList(),
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: "Yoshi",
            titleColor: AppColors.otmStudentsPageDecorativeColor,
          );
        }
      },
    );
  }
}

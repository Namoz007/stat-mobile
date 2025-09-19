import 'package:stat_edu_mobile/sources.dart';

class StudentsCitizenshipAgeData extends StatefulWidget {
  const StudentsCitizenshipAgeData({super.key});

  @override
  State<StudentsCitizenshipAgeData> createState() =>
      _StudentsCitizenshipAgeDataState();
}

class _StudentsCitizenshipAgeDataState
    extends State<StudentsCitizenshipAgeData> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsCitizenshipBloc>().add(
      GetAgeStudentsCitizenshipEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsCitizenshipBloc, StudentsCitizenshipState>(
      builder: (context, state) {


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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(ageData.keys.toList().length, (index) {
                  return Column(
                    children: [
                      Text(
                        getTranslateWord(context: context, value: formatAgeWithKey(ageData.keys.toList()[index])),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state.studentsAgeData
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
                    state.studentsAgeData
                        .map((value) => value.eduType)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsAgeData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsAgeData)
                        if (i == v.eduType) ageData[v.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsAgeData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsAgeData)
                        if (i == v.eduType) v.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsAgeData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsAgeData)
                        if (i == v.eduType) ageData[v.name]!,
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

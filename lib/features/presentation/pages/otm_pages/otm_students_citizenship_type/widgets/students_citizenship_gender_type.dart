import 'package:stat_edu_mobile/sources.dart';

class StudentsCitizenshipGenderType extends StatefulWidget {
  const StudentsCitizenshipGenderType({super.key});

  @override
  State<StudentsCitizenshipGenderType> createState() =>
      _StudentsCitizenshipGenderTypeState();
}

class _StudentsCitizenshipGenderTypeState
    extends State<StudentsCitizenshipGenderType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsCitizenshipBloc>().add(
      GetGenderStudentsCitizenshipEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsCitizenshipBloc, StudentsCitizenshipState>(
      builder: (context, state) {

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
              const SizedBox(height: 10),
              ShowMultiStatisticChart(
                statisticTitles:
                    state.studentsGenderData
                        .map((value) => value.eduType)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsGenderData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsGenderData)
                        if (i == v.eduType) genderData[v.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsGenderData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsGenderData)
                        if (i == v.eduType) v.count,
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
                      for (var v in state.studentsGenderData)
                        if (i == v.eduType) genderData[v.name]!,
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
              const SizedBox(height: 10),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: AppLocalizations.of(context)!.byGender,
            titleColor: AppColors.otmStudentsPageDecorativeColor,
          );
        }
      },
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class StudentsByGenderEductionType extends StatefulWidget {
  const StudentsByGenderEductionType({super.key});

  @override
  State<StudentsByGenderEductionType> createState() =>
      _StudentsByGenderEductionTypeState();
}

class _StudentsByGenderEductionTypeState
    extends State<StudentsByGenderEductionType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsEducationFormControllerBloc>().add(
      GetGenderStudentsEducationFormControllerEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      StudentsEducationFormControllerBloc,
      StudentsEducationFormControllerState
    >(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.byGender,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.otmStudentsPageDecorativeColor,
                    ),
                  ),
                  MultiStatisticTitle(
                    title: genderData.keys.map((value) => getTranslateWord(context: context, value: value)).toList(),
                    titleColors: genderData.values.toList(),
                  ),
                ],
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
              const SizedBox(height: 10),
              ShowMultiStatisticChart(
                statisticTitles: state.studentsGenderData.map((value) => value.eduType).toSet().toList(),
                statisticLabelColor: [
                  for(var i in state.studentsGenderData.map((value) => value.eduType).toSet().toList())
                    [
                      for(var z in state.studentsGenderData)
                        if(i == z.eduType)
                          genderData[z.name]!
                    ]
                ],
                statisticItemNumber: [
                  for(var i in state.studentsGenderData.map((value) => value.eduType).toSet().toList())
                    [
                      for(var z in state.studentsGenderData)
                        if(i == z.eduType)
                          z.count
                    ]
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for(var i in state.studentsGenderData.map((value) => value.eduType).toSet().toList())
                    [
                      for(var z in state.studentsGenderData)
                        if(i == z.eduType)
                          genderData[z.name]!
                    ]
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
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.byGender, titleColor: AppColors.otmStudentsPageDecorativeColor,);
        }
      },
    );
  }
}

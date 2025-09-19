import 'package:stat_edu_mobile/sources.dart';

class StudentsByAgeEducationForm extends StatefulWidget {
  const StudentsByAgeEducationForm({super.key});

  @override
  State<StudentsByAgeEducationForm> createState() =>
      _StudentsByAgeEducationFormState();
}

class _StudentsByAgeEducationFormState
    extends State<StudentsByAgeEducationForm> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsEducationFormControllerBloc>().add(
      GetAgeStatisticStudentsEducationFormControllerEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      StudentsEducationFormControllerBloc,
      StudentsEducationFormControllerState
    >(
      builder: (context, state) {


        if (state.studentsAgeByEducationForm.isNotEmpty) {
          Map<String, Color> ageData = {};
          state.studentsAgeByEducationForm
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
              const SizedBox(height: 13),
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
                          state.studentsAgeByEducationForm
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
              ShowMultiStatisticChart(
                statisticTitles:
                    state.studentsAgeByEducationForm
                        .map((value) => value.eduType)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsAgeByEducationForm
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsAgeByEducationForm)
                        if (i == z.eduType) ageData[z.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsAgeByEducationForm
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsAgeByEducationForm)
                        if (i == z.eduType) z.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsAgeByEducationForm
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsAgeByEducationForm)
                        if (i == z.eduType) ageData[z.name]!,
                    ],
                ],
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 25,
                labelCountPercent: 20,
                labelPercent: 55,
              ),
              ShowRectangleTitle(
                title:
                    ageData.keys
                        .toList()
                        .map((value) => formatAgeWithKey(value))
                        .map((value) => getTranslateWord(context: context, value: value)).toList(),
                colors: ageData.values.toList(),
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.age, titleColor: AppColors.otmStudentsPageDecorativeColor,);
        }
      },
    );
  }
}

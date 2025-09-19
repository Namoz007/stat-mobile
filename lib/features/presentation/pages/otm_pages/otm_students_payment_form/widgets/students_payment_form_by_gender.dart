import 'package:stat_edu_mobile/sources.dart';

class StudentsPaymentFormByGender extends StatefulWidget {
  const StudentsPaymentFormByGender({super.key});

  @override
  State<StudentsPaymentFormByGender> createState() =>
      _StudentsPaymentFormByGenderState();
}

class _StudentsPaymentFormByGenderState
    extends State<StudentsPaymentFormByGender> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsPaymentFormBloc>().add(
      GetGenderStudentsPaymentFormEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsPaymentFormBloc, StudentsPaymentFormState>(
      builder: (context, state) {

        if (state.studentsByGenderData.isNotEmpty) {
          Map<String, Color> studentsGender = {};
          state.studentsByGenderData
              .map((value) => value.name)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (index, value) =>
                    studentsGender[value] = AppColors.colors1[index],
              );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.byGender,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.otmStudentsPageDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(studentsGender.keys.toList().length, (
                  index,
                ) {
                  return Column(
                    children: [
                      Text(
                        getTranslateWord(context: context, value: studentsGender.keys.toList()[index]),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state.studentsByGenderData
                              .map(
                                (value) =>
                                    value.name ==
                                            studentsGender.keys.toList()[index]
                                        ? value.count
                                        : 0,
                              )
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
                    state.studentsByGenderData
                        .map((value) => value.eduType)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsByGenderData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsByGenderData)
                        if (i == v.eduType) studentsGender[v.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsByGenderData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsByGenderData)
                        if (i == v.eduType) v.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsByGenderData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsByGenderData)
                        if (i == v.eduType) studentsGender[v.name]!,
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
              const SizedBox(height: 12),
              ShowRectangleTitle(
                title: studentsGender.keys.map((value) => getTranslateWord(context: context, value: value)).toList(),
                colors: studentsGender.values.toList(),
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
              const SizedBox(height: 10,),
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.byGender, titleColor: AppColors.otmStudentsPageDecorativeColor,);
        }
      },
    );
  }
}

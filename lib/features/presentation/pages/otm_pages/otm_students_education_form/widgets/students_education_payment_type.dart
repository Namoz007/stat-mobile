import 'package:stat_edu_mobile/sources.dart';

class StudentsEducationPaymentType extends StatefulWidget {
  const StudentsEducationPaymentType({super.key});

  @override
  State<StudentsEducationPaymentType> createState() =>
      _StudentsEducationPaymentTypeState();
}

class _StudentsEducationPaymentTypeState
    extends State<StudentsEducationPaymentType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsEducationFormControllerBloc>().add(
      GetPaymentTypeStudentsEducationFormControllerEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      StudentsEducationFormControllerBloc,
      StudentsEducationFormControllerState
    >(
      builder: (context, state) {

        if (state.studentsEducationPaymentType.isNotEmpty) {
          Map<String, Color> statisticData = {};
          state.studentsEducationPaymentType
              .map((value) => value.name)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) => statisticData[value] = AppColors.allColors[key],
              );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.paymentForm,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.otmStudentsPageDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles:
                    state.studentsEducationPaymentType
                        .map((value) => value.eduType)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsEducationPaymentType
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsEducationPaymentType)
                        if (i == z.eduType) statisticData[z.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsEducationPaymentType
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsEducationPaymentType)
                        if (i == z.eduType) z.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsEducationPaymentType
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsEducationPaymentType)
                        if (i == z.eduType) statisticData[z.name]!,
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
                title: statisticData.keys.map((value) => getTranslateWord(context: context, value: value)).toList(),
                colors: statisticData.values.toList(),
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
              const SizedBox(height: 10),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: AppLocalizations.of(context)!.paymentForm,
            titleColor: AppColors.otmStudentsPageDecorativeColor,
          );
        }
      },
    );
  }
}

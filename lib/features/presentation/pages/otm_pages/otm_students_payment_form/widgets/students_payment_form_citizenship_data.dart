import 'package:stat_edu_mobile/sources.dart';

class StudentsPaymentFormCitizenshipData extends StatefulWidget {
  const StudentsPaymentFormCitizenshipData({super.key});

  @override
  State<StudentsPaymentFormCitizenshipData> createState() =>
      _StudentsPaymentFormCitizenshipDataState();
}

class _StudentsPaymentFormCitizenshipDataState
    extends State<StudentsPaymentFormCitizenshipData> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsPaymentFormBloc>().add(
      GetCitizenshipStudentsPaymentFormEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsPaymentFormBloc, StudentsPaymentFormState>(
      builder: (context, state) {

        if (state.studentsCitizenshipData.isNotEmpty) {
          Map<String, Color> citizenshipData = {};
          state.studentsCitizenshipData
              .map((value) => value.name)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) =>
                    citizenshipData[value] = AppColors.allColors[key],
              );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.citizenship,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.otmStudentsPageDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles:
                    state.studentsCitizenshipData
                        .map((value) => value.eduType)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsCitizenshipData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsCitizenshipData)
                        if (i == v.eduType) citizenshipData[v.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsCitizenshipData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsCitizenshipData)
                        if (i == v.eduType) v.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsCitizenshipData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsCitizenshipData)
                        if (i == v.eduType) citizenshipData[v.name]!,
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
                title: citizenshipData.keys.map((value) => getTranslateWord(context: context, value: value)).toList(),
                colors: citizenshipData.values.toList(),
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
              const SizedBox(height: 10,),
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.citizenship, titleColor: AppColors.otmStudentsPageDecorativeColor,);
        }
      },
    );
  }
}

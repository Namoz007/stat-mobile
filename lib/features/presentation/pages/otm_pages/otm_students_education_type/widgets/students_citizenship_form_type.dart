import 'package:stat_edu_mobile/sources.dart';

class StudentsCitizenshipFormType extends StatefulWidget {
  const StudentsCitizenshipFormType({super.key});

  @override
  State<StudentsCitizenshipFormType> createState() =>
      _StudentsCitizenshipFormTypeState();
}

class _StudentsCitizenshipFormTypeState
    extends State<StudentsCitizenshipFormType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsControllerBloc>().add(
      GetStudentsCitizenshipStudentsControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsControllerBloc, StudentsControllerState>(
      builder: (context, state) {
        if (state.studentsCitizenshipStatisticData.isNotEmpty) {
          Map<String, Color> citizenshipData = {};
          state.studentsCitizenshipStatisticData
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
              const SizedBox(height: 13),
              ShowMultiStatisticChart(
                statisticTitles:
                    state.studentsCitizenshipStatisticData
                        .map((value) => value.eduType)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsCitizenshipStatisticData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsCitizenshipStatisticData)
                        if (i == z.eduType) citizenshipData[z.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsCitizenshipStatisticData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsCitizenshipStatisticData)
                        if (i == z.eduType) z.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsCitizenshipStatisticData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsCitizenshipStatisticData)
                        if (i == z.eduType) citizenshipData[z.name]!,
                    ],
                ],
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelCountPercent: 20,
                labelPercent: 60,
              ),
              ShowRectangleTitle(
                title: citizenshipData.keys.map((value) => getTranslateWord(context: context, value: value)).toList(),
                colors: citizenshipData.values.toList(),
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
              const SizedBox(height: 12),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: AppLocalizations.of(context)!.citizenship,
            titleColor: AppColors.otmStudentsPageDecorativeColor,
          );
        }
      },
    );
  }
}

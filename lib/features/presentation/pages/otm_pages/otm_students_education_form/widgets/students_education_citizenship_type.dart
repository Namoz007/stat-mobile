import 'package:stat_edu_mobile/sources.dart';

class StudentsEducationCitizenshipType extends StatefulWidget {
  const StudentsEducationCitizenshipType({super.key});

  @override
  State<StudentsEducationCitizenshipType> createState() =>
      _StudentsEducationCitizenshipTypeState();
}

class _StudentsEducationCitizenshipTypeState
    extends State<StudentsEducationCitizenshipType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsEducationFormControllerBloc>().add(
      GetCitizenshipStudentsEducationFormControllerEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      StudentsEducationFormControllerBloc,
      StudentsEducationFormControllerState
    >(
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
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.otmStudentsPageDecorativeColor,
                ),
              ),
              const SizedBox(height: 13),
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
                      for (var z in state.studentsCitizenshipData)
                        if (i == z.eduType) citizenshipData[z.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsCitizenshipData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsCitizenshipData)
                        if (i == z.eduType) z.count,
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
                      for (var z in state.studentsCitizenshipData)
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
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.citizenship, titleColor: AppColors.otmStudentsPageDecorativeColor,);
        }
      },
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class StudentsEducationFormType extends StatefulWidget {
  const StudentsEducationFormType({super.key});

  @override
  State<StudentsEducationFormType> createState() =>
      _StudentsEducationFormTypeState();
}

class _StudentsEducationFormTypeState extends State<StudentsEducationFormType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsControllerBloc>().add(
      GetStudentsOtmEducationFormStudentsControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsControllerBloc, StudentsControllerState>(
      builder: (context, state) {
        if (state.studentsOtmEducationFormData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              state.studentsOtmEducationFormData
                  .map((value) => value.eduType)
                  .toSet()
                  .toList()
                  .length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CustomOtmContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${AppLocalizations.of(context)!.educationForm} (${getTranslateWord(context: context, value: state.studentsOtmEducationFormData.map((value) => value.eduType).toSet().toList()[index])})",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ),
                        const SizedBox(height: 14),
                        ShowStatisticChart(
                          statisticTitles: state.studentsOtmEducationFormData.where((value) => value.eduType == state.studentsOtmEducationFormData.map((value) => value.eduType).toSet().toList()[index]).toList().map((value) => value.name).toList().reversed.toList(),
                          statisticLabelColor: AppColors.circleStatisticBlueChart,
                          statisticItemNumber: state.studentsOtmEducationFormData.where((value) => value.eduType == state.studentsOtmEducationFormData
                              .map((value) => value.eduType)
                              .toSet()
                              .toList()[index]).toList().map((value) => value.count).toList().reversed.toList(),
                          statisticItemNumberBorderColors: Colors.grey.shade50,
                          statisticItemNumberColor:
                              AppColors.circleStatisticBlueChart,
                          statisticLineCount: 5,
                          labelHeight: 30,
                          statisticLineColor: Colors.grey.shade300,
                          showBottomStatisticNumber: true,
                          titlePercent: 30,
                          labelPercent: 50,
                          labelCountPercent: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

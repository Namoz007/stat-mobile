import 'package:stat_edu_mobile/sources.dart';

class StudentsRegionSectionEducationFormData extends StatefulWidget {
  const StudentsRegionSectionEducationFormData({super.key});

  @override
  State<StudentsRegionSectionEducationFormData> createState() =>
      _StudentsRegionSectionEducationFormDataState();
}

class _StudentsRegionSectionEducationFormDataState
    extends State<StudentsRegionSectionEducationFormData> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsRegionSectionBloc>().add(
      GetEducationFormStudentsRegionSectionEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsRegionSectionBloc, StudentsRegionSectionState>(
      builder: (context, state) {

        if (state.studentsEducationForm.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              state.studentsEducationForm
                  .map((value) => value.region)
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
                          "${AppLocalizations.of(context)!.educationForm}:${getTranslateWord(context: context, value: state.studentsEducationForm.map((value) => value.region).toSet().toList()[index])}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ShowStatisticChart(
                          statisticTitles:
                              state.studentsEducationForm
                                  .where(
                                    (value) =>
                                        value.region ==
                                        state.studentsEducationForm
                                            .map((value) => value.region)
                                            .toSet()
                                            .toList()[index],
                                  )
                                  .toList()
                                  .map((value) => value.name)
                                  .toSet()
                                  .toList(),
                          statisticLabelColor: AppColors.blueCircleChartColor,
                          statisticItemNumber: [
                            for (var i
                                in state.studentsEducationForm
                                    .where(
                                      (value) =>
                                          value.region ==
                                          state.studentsEducationForm
                                              .map((value) => value.region)
                                              .toSet()
                                              .toList()[index],
                                    )
                                    .toList()
                                    .map((value) => value.name)
                                    .toSet()
                                    .toList())
                              for (var z in state.studentsEducationForm)
                                if (i == z.name &&
                                    z.region ==
                                        state.studentsEducationForm
                                            .map((value) => value.region)
                                            .toSet()
                                            .toList()[index])
                                  z.count,
                          ],
                          statisticItemNumberBorderColors: Colors.grey.shade50,
                          statisticItemNumberColor:
                              AppColors.circleStatisticBlueChart,
                          statisticLineCount: 5,
                          labelHeight: 30,
                          statisticLineColor: Colors.grey.shade300,
                          showBottomStatisticNumber: true,
                          titlePercent: 25,
                          labelPercent: 55,
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
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomOtmContainer(
              child: ShowLoadingWidget(
                title: AppLocalizations.of(context)!.educationForm,
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
            ),
          );
        }
      },
    );
  }
}

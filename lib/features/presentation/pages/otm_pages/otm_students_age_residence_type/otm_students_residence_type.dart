import 'package:stat_edu_mobile/sources.dart';

class OtmStudentsResidenceType extends StatefulWidget {
  const OtmStudentsResidenceType({super.key});

  @override
  State<OtmStudentsResidenceType> createState() =>
      _OtmStudentsResidenceTypeState();
}

class _OtmStudentsResidenceTypeState extends State<OtmStudentsResidenceType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsAgeResidenceBloc>().add(
      GetGenderForResidenceStudentsAgeResidenceEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: BlocBuilder<StudentsAgeResidenceBloc, StudentsAgeResidenceState>(
        builder: (context, state) {

          if (state.studentsGenderForResidence.isNotEmpty) {
            Map<String, Color> genderData = {};
            state.studentsGenderForResidence
                .map((value) => value.name)
                .toSet()
                .toList()
                .asMap()
                .forEach(
                  (key, value) => genderData[value] = AppColors.colors1[key],
                );
            return ListView(
              padding: const EdgeInsets.all(0),
              children: [
                CustomOtmContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.byGender,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.otmStudentsPageDecorativeColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          genderData.keys.toList().length,
                          (index) {
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
                                    state.studentsGenderForResidence
                                        .where(
                                          (value) =>
                                              value.name ==
                                              genderData.keys.toList()[index],
                                        )
                                        .toList()
                                        .map((value) => value.count)
                                        .reduce((a, b) => a + b),
                                  ),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        AppColors
                                            .otmStudentsPageDecorativeColor,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      ShowMultiStatisticChart(
                        statisticTitles:
                            state.studentsGenderForResidence
                                .map((value) => value.eduType)
                                .toSet()
                                .toList(),
                        statisticLabelColor: [
                          for (var i
                              in state.studentsGenderForResidence
                                  .map((value) => value.eduType)
                                  .toSet()
                                  .toList())
                            [
                              for (var z in state.studentsGenderForResidence)
                                if (i == z.eduType) genderData[z.name]!,
                            ],
                        ],
                        statisticItemNumber: [
                          for (var i
                              in state.studentsGenderForResidence
                                  .map((value) => value.eduType)
                                  .toSet()
                                  .toList())
                            [
                              for (var z in state.studentsGenderForResidence)
                                if (i == z.eduType) z.count,
                            ],
                        ],
                        statisticItemNumberBorderColors: [],
                        statisticItemNumberColor: [
                          for (var i
                              in state.studentsGenderForResidence
                                  .map((value) => value.eduType)
                                  .toSet()
                                  .toList())
                            [
                              for (var z in state.studentsGenderForResidence)
                                if (i == z.eduType) genderData[z.name]!,
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
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return CustomOtmContainer(
              child: ShowLoadingWidget(
                title: AppLocalizations.of(context)!.byGender,
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
            );
          }
        },
      ),
      onRefresh: () async {
        context.read<StudentsAgeResidenceBloc>().add(UpdateStateStudentsAgeResidenceEvent());
      },
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class StudentsPaymentStatisticTypePage extends StatefulWidget {
  const StudentsPaymentStatisticTypePage({super.key});

  @override
  State<StudentsPaymentStatisticTypePage> createState() =>
      _StudentsPaymentStatisticTypePageState();
}

class _StudentsPaymentStatisticTypePageState
    extends State<StudentsPaymentStatisticTypePage> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsControllerBloc>().add(
      GetStudentsPaymentTypeStudentsControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsControllerBloc, StudentsControllerState>(
      builder: (context, state) {
        if (state.studentsPaymentTypeStatisticData.isNotEmpty) {
          Map<String, Color> paymentData = {};
          state.studentsPaymentTypeStatisticData
              .map((value) => value.name)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) => paymentData[value] = AppColors.colors1[key],
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  state.studentsPaymentTypeStatisticData
                      .map((value) => value.name)
                      .toSet()
                      .toList()
                      .length,
                  (index) {
                    return Column(
                      children: [
                        Text(
                          getTranslateWord(context: context, value: state.studentsPaymentTypeStatisticData
                              .map((value) => value.name)
                              .toSet()
                              .toList()[index],),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ), 
                        Text(
                          formatNumber(
                            state.studentsPaymentTypeStatisticData
                                .where(
                                  (value) =>
                                      value.name ==
                                      state.studentsPaymentTypeStatisticData
                                          .map((value) => value.name)
                                          .toSet()
                                          .toList()[index],
                                )
                                .toList()
                                .map((value) => value.count)
                                .toList()
                                .reduce((a, b) => a + b),
                          ),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles:
                    state.studentsPaymentTypeStatisticData
                        .map((value) => value.eduType)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsPaymentTypeStatisticData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsPaymentTypeStatisticData)
                        if (i == v.eduType) paymentData[v.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsPaymentTypeStatisticData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsPaymentTypeStatisticData)
                        if (i == v.eduType) v.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsPaymentTypeStatisticData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsPaymentTypeStatisticData)
                        if (i == v.eduType) paymentData[v.name]!,
                    ],
                ],
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 25,
                labelPercent: 55,
                labelCountPercent: 20,
              ),
              ShowRectangleTitle(
                title: paymentData.keys.toList().map((value) => getTranslateWord(context: context, value: value)).toList(),
                colors: paymentData.values.toList(),
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
              const SizedBox(height: 12),
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

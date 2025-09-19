import 'package:stat_edu_mobile/sources.dart';

class StudentsPaymentFormAgeData extends StatefulWidget {
  const StudentsPaymentFormAgeData({super.key});

  @override
  State<StudentsPaymentFormAgeData> createState() =>
      _StudentsPaymentFormAgeDataState();
}

class _StudentsPaymentFormAgeDataState
    extends State<StudentsPaymentFormAgeData> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsPaymentFormBloc>().add(
      GetAgeStudentsPaymentFormEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsPaymentFormBloc, StudentsPaymentFormState>(
      builder: (context, state) {
        if (state.studentsAgeData.isNotEmpty) {
          Map<String, Color> studentsAge = {};
          state.studentsAgeData
              .map((value) => value.name)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (index, value) =>
                    studentsAge[value] = AppColors.allColors[index],
              );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.age,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.otmStudentsPageDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(state.studentsAgeData.map((value) => value.name).toSet().toList().length, (index) => Column(
                    children: [
                      Text(
                        getTranslateWord(context: context, value: formatAgeWithKey(state.studentsAgeData.map((value) => value.name).toSet().toList()[index])),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        formatNumber(
                          state.studentsAgeData.map((value) => value.name == state.studentsAgeData.map((value) => value.name).toSet().toList()[index] ? value.count : 0,)
                              .toList()
                              .reduce((a, b) => a + b),
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.otmStudentsPageDecorativeColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ShowMultiStatisticChart(
                statisticTitles:
                    state.studentsAgeData
                        .map((value) => value.eduType)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsAgeData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsAgeData)
                        if (i == v.eduType) studentsAge[v.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsAgeData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsAgeData)
                        if (i == v.eduType) v.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsAgeData
                          .map((value) => value.eduType)
                          .toSet()
                          .toList())
                    [
                      for (var v in state.studentsAgeData)
                        if (i == v.eduType) studentsAge[v.name]!,
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
                title: state.studentsAgeData.map((value) => formatAgeWithKey(value.name)).toSet().map((value) => getTranslateWord(context: context, value: value)).toList(),
                colors: state.studentsAgeData.map((value) => value.name).toSet().toList().map((value) => studentsAge[value]!).toList(),
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
              const SizedBox(height: 10,),
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.age, titleColor: AppColors.otmStudentsPageDecorativeColor,);
        }
      },
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class StudentsManyBestArea extends StatefulWidget {
  const StudentsManyBestArea({super.key});

  @override
  State<StudentsManyBestArea> createState() => _StudentsManyBestAreaState();
}

class _StudentsManyBestAreaState extends State<StudentsManyBestArea> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsControllerBloc>().add(
      GetManyBestStudentsControllerEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsControllerBloc, StudentsControllerState>(
      builder: (context, state) {
        if(state.manyBestStudentsArea.isNotEmpty){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.top5QualifiedGraduatingRegions,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.decorativeColor,
                ),
              ),
              const SizedBox(height: 13),
              ShowStatisticChart(
                statisticTitles:
                state.manyBestStudentsArea
                    .where(
                      (i) =>
                  sortedListNumbers(
                    state.manyBestStudentsArea
                        .map((value) => value.count)
                        .toList(),
                    5,
                  ).indexWhere((v) => v == i.count) !=
                      -1,
                )
                    .toList()
                    .map((r) => r.region)
                    .toList(),
                statisticLabelColor: AppColors.lightPinkChartColor,
                statisticItemNumber:
                state.manyBestStudentsArea
                    .where(
                      (i) =>
                  sortedListNumbers(
                    state.manyBestStudentsArea
                        .map((value) => value.count)
                        .toList(),
                    5,
                  ).indexWhere((v) => v == i.count) !=
                      -1,
                )
                    .toList()
                    .map((r) => r.count)
                    .toList(),
                statisticItemNumberBorderColors:
                AppColors.lightPinkChartColor,
                statisticItemNumberColor: Colors.pink,
                statisticLineCount: 5,
                labelHeight: 37,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                labelPercent: 60,
                titlePercent: 20,
                labelCountPercent: 20,
              )
            ],
          );
        }else{
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.top5QualifiedGraduatingRegions, titleColor: Colors.black);
        }
      },
    );
  }
}

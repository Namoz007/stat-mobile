import 'package:stat_edu_mobile/sources.dart';

class StudentsLocationTop5Area extends StatefulWidget {
  const StudentsLocationTop5Area({super.key});

  @override
  State<StudentsLocationTop5Area> createState() =>
      _StudentsLocationTop5AreaState();
}

class _StudentsLocationTop5AreaState extends State<StudentsLocationTop5Area> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtmControllerBloc, OtmControllerState>(
      builder: (context, state) {
        if (state.otmDataWithAddress.isNotEmpty) {
          List<int> counts = state.otmDataWithAddress.map((value) => value.count).toList();
          counts.sort();
          counts = counts.reversed.toList().sublist(0,5);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.top5StudentDenseRegions,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.decorativeColor,
                ),
              ),
              const SizedBox(height: 13),
              ShowStatisticChart(
                statisticTitles: counts.map((value) => state.otmDataWithAddress[state.otmDataWithAddress.indexWhere((v) => v.count == value)].region).toList(),
                statisticLabelColor: AppColors.blueCircleChartColor,
                statisticItemNumber: counts,
                statisticItemNumberBorderColors: Colors.grey.shade50,
                statisticItemNumberColor: AppColors.circleStatisticBlueChart,
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: false,
                titlePercent: 25,
                labelPercent: 55,
                labelCountPercent: 20,
              ),
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.top5StudentDenseRegions, titleColor: Colors.black);
        }
      },
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class TopFiveManyStudentsUniversities extends StatefulWidget {
  const TopFiveManyStudentsUniversities({super.key});

  @override
  State<TopFiveManyStudentsUniversities> createState() =>
      _TopFiveManyStudentsUniversitiesState();
}

class _TopFiveManyStudentsUniversitiesState
    extends State<TopFiveManyStudentsUniversities> {
  @override
  void initState() {
    super.initState();
    context.read<OtmControllerBloc>().add(
      GetTopFiveManyUniversitiesOtmControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtmControllerBloc, OtmControllerState>(
      builder: (context, state) {
        if (state.topFiveUniversityData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.top5UniversitiesByStudentCount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.decorativeColor,
                ),
              ),
              const SizedBox(height: 13),
              ShowStatisticChart(
                statisticTitles: state.topFiveUniversityData.map((value) => value.universityName).toList(),
                statisticLabelColor: AppColors.blueCircleChartColor,
                statisticItemNumber: state.topFiveUniversityData.map((value) => value.studentsCount).toList(),
                statisticItemNumberBorderColors: Colors.grey.shade50,
                statisticItemNumberColor: AppColors.blueCircleChartColor,
                statisticLineCount: 5,
                labelHeight: 35,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: false,
              ),
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.top5UniversitiesByStudentCount, titleColor: Colors.black);
        }
      },
    );
  }
}

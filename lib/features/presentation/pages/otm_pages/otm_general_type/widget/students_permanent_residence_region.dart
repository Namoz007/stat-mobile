import 'package:stat_edu_mobile/sources.dart';

class StudentsPermanentResidenceRegion extends StatefulWidget {
  const StudentsPermanentResidenceRegion({super.key});

  @override
  State<StudentsPermanentResidenceRegion> createState() =>
      _StudentsPermanentResidenceRegionState();
}

class _StudentsPermanentResidenceRegionState
    extends State<StudentsPermanentResidenceRegion> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsControllerBloc, StudentsControllerState>(
      builder: (context, state) {
        if(state.manyBestStudentsArea.isNotEmpty){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.studentsByPermanentRegion,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.decorativeColor,
                ),
              ),
              const SizedBox(height: 13),
              ShowStatisticChart(
                statisticTitles:
                state.manyBestStudentsArea
                    .map((value) => value.region)
                    .toList(),
                statisticLabelColor: AppColors.tealChartColor,
                statisticItemNumber:
                state.manyBestStudentsArea
                    .map((value) => value.count)
                    .toList(),
                statisticItemNumberBorderColors: AppColors.tealChartColor,
                statisticItemNumberColor: Colors.teal,
                statisticLineCount: 6,
                labelHeight: 37,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelCountPercent: 20,
                labelPercent: 60,
              ),
              const SizedBox(height: 20,),
            ],
          );
        }else{
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.studentsByPermanentRegion, titleColor: Colors.black);
        }

      },
    );
  }
}

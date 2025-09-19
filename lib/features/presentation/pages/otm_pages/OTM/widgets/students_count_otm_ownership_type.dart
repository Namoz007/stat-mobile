import 'package:stat_edu_mobile/sources.dart';

class StudentsCountOtmOwnershipType extends StatelessWidget {
  const StudentsCountOtmOwnershipType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsControllerBloc, StudentsControllerState>(
      builder: (context, state) {
        if(state.studentsOTMCourses.isNotEmpty){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.studentsByOwnershipType,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.decorativeColor,
                ),
              ),
              const SizedBox(height: 10,),
              ShowStatisticChart(statisticTitles: state.studentsOTMCourses.map((value) => value.ownership).toList(), statisticLabelColor: AppColors.lightGreenChartColor, statisticItemNumber: state.studentsOTMCourses.map((value) => value.ownership).toList().map((value) => state.studentsOTMCourses.where((v) => v.ownership == value).toList().map((value) => value.course1Count + value.course2Count + value.course3Count + value.course4Count + value.course5Count + value.course6Count).toList().reduce((a,b) => a + b),).toList(), statisticItemNumberBorderColors: Colors.grey.shade50, statisticItemNumberColor: AppColors.lightGreenChartColor, statisticLineCount: 5, labelHeight: 35, statisticLineColor: Colors.grey.shade300, showBottomStatisticNumber: false,titlePercent: 25,labelPercent: 55,labelCountPercent: 20,),
            ],
          );
        }else{
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.studentsByOwnershipType, titleColor: Colors.black);
        }
      },
    );
  }
}

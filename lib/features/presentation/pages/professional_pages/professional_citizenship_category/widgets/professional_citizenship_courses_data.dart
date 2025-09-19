import 'package:stat_edu_mobile/sources.dart';

class ProfessionalCitizenshipCoursesData extends StatelessWidget {
  const ProfessionalCitizenshipCoursesData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.citizenshipResponseData.courseData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.courses,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.professionalDecorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              StatisticTitleCount(
                title: [AppLocalizations.of(context)!.firstCourse,AppLocalizations.of(context)!.secondCourse,AppLocalizations.of(context)!.thirdCourse],
                count: [
                  state.citizenshipResponseData.courseData
                      .map((value) => value.course1)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.citizenshipResponseData.courseData
                      .map((value) => value.course2)
                      .toList()
                      .reduce((a, b) => a + b),
                  state.citizenshipResponseData.courseData
                      .map((value) => value.course3)
                      .toList()
                      .reduce((a, b) => a + b),
                ],
                titleColor: Colors.black,
                countColor: AppColors.professionalDecorativeColor,
                titleSize: 16,
                countSize: 18,
                alignment: MainAxisAlignment.spaceEvenly,
                isWrap: false,
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles: state.citizenshipResponseData.courseData.map((value) => value.educaiton_type).toList(),
                statisticLabelColor:state.citizenshipResponseData.courseData.map((value) => value.educaiton_type).toList().map((value) => [AppColors.amberCircleChartColor,AppColors.circleStatisticBlueChart,AppColors.greenBarChart,]).toList(),
                statisticItemNumber: [
                  for(var i in state.citizenshipResponseData.courseData.map((value) => value.educaiton_type).toList())
                    for(var z in state.citizenshipResponseData.courseData)
                      if(i == z.educaiton_type)
                        [z.course1,z.course2,z.course3]
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: state.citizenshipResponseData.courseData.map((value) => value.educaiton_type).toList().map((value) => [AppColors.amberCircleChartColor,AppColors.circleStatisticBlueChart,AppColors.greenBarChart,]).toList(),
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 25,
                labelPercent: 55,
                labelCountPercent: 20,
              ),
              ShowRectangleTitle(title: [AppLocalizations.of(context)!.firstCourse,AppLocalizations.of(context)!.secondCourse,AppLocalizations.of(context)!.thirdCourse], colors: [AppColors.amberCircleChartColor,AppColors.circleStatisticBlueChart,AppColors.greenBarChart], titleColor: AppColors.professionalDecorativeColor),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: AppLocalizations.of(context)!.courses,
            titleColor: AppColors.professionalDecorativeColor,
          );
        }
      },
    );
  }
}

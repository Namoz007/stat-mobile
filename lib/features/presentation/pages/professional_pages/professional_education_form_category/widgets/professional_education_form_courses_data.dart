import 'package:stat_edu_mobile/sources.dart';

class ProfessionalEducationFormCoursesData extends StatelessWidget {
  const ProfessionalEducationFormCoursesData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.educationFormData.courseData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Kurslar", style: TextStyle(fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColors.professionalDecorativeColor,),),
              const SizedBox(height: 12,),
              StatisticTitleCount(title: ['1-kurs', '2-kurs', '3-kurs'],
                  count: [
                    state.educationFormData.courseData.map((value) =>
                    value
                        .course1).toList().reduce((a, b) => a + b),
                    state.educationFormData.courseData.map((value) =>
                    value
                        .course2).toList().reduce((a, b) => a + b),
                    state.educationFormData.courseData.map((value) =>
                    value
                        .course3).toList().reduce((a, b) => a + b),
                  ],
                  titleColor: Colors.black,
                  countColor: AppColors.professionalDecorativeColor,
                  titleSize: 16,
                  countSize: 18,
                  alignment: MainAxisAlignment.spaceEvenly,
                  isWrap: false),
              const SizedBox(height: 20,),
              ShowMultiStatisticChart(
                statisticTitles: state.educationFormData.courseData.map((value) => value.educaiton_type).toList(),
                statisticLabelColor: state.educationFormData.courseData.map((value) => value.educaiton_type).toList().map((value) => [AppColors.amberCircleChartColor,AppColors.circleStatisticBlueChart,AppColors.greenBarChart,],).toList(),
                statisticItemNumber: [
                  for(var i in state.educationFormData.courseData.map((value) => value.educaiton_type).toList())
                    for(var z in state.educationFormData.courseData)
                      if(i == z.educaiton_type)
                        [
                          z.course1,
                          z.course2,
                          z.course3
                        ]
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: state.educationFormData.courseData.map((value) => value.educaiton_type).toList().map((value) => [AppColors.amberCircleChartColor,AppColors.circleStatisticBlueChart,AppColors.greenBarChart,],).toList(),
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelCountPercent: 20,
                labelPercent: 60,
              ),
              ShowRectangleTitle(title: ['1-kurs', '2-kurs', '3-kurs'], colors: [AppColors.amberCircleChartColor,AppColors.circleStatisticBlueChart,AppColors.greenBarChart], titleColor: AppColors.professionalDecorativeColor,),
              const SizedBox(height: 12,),

            ],
          );
        } else {
          return ShowLoadingWidget(title: "Kurslar",
            titleColor: AppColors.professionalDecorativeColor,);
        }
      },
    );
  }
}

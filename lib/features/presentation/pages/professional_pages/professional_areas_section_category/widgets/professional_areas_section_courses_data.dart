import 'package:stat_edu_mobile/sources.dart';

class ProfessionalAreasSectionCoursesData extends StatelessWidget {
  const ProfessionalAreasSectionCoursesData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if (state.areasSectionResponseData.coursesData.isNotEmpty) {
          Map<String, List<int>> courses = {
            AppLocalizations.of(context)!.firstCourse:
                state.areasSectionResponseData.coursesData
                    .map((value) => value.course1)
                    .toList(),
          AppLocalizations.of(context)!.secondCourse:
                state.areasSectionResponseData.coursesData
                    .map((value) => value.course2)
                    .toList(),
          AppLocalizations.of(context)!.thirdCourse:
                state.areasSectionResponseData.coursesData
                    .map((value) => value.course3)
                    .toList(),
          };
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(courses.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomOtmContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.courses}-${courses.keys.toList()[index]}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.professionalDecorativeColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      StatisticTitleCount(title: [courses.keys.toList()[index]], count: [courses[courses.keys.toList()[index]]!.reduce((a,b) => a + b)], titleColor: Colors.black, countColor: AppColors.professionalDecorativeColor, titleSize: 16, countSize: 18, alignment: MainAxisAlignment.start, isWrap: false,),
                      const SizedBox(height: 12,),
                      ShowStatisticChart(
                        statisticTitles: state.areasSectionResponseData.coursesData.map((value) => value.educaiton_type).toList(),
                        statisticLabelColor: AppColors.circleStatisticBlueChart,
                        statisticItemNumber: courses[courses.keys.toList()[index]]!,
                        statisticItemNumberBorderColors: Colors.grey.shade50,
                        statisticItemNumberColor: AppColors.circleStatisticBlueChart,
                        statisticLineCount: 5,
                        labelHeight: 35,
                        statisticLineColor: Colors.grey.shade300,
                        showBottomStatisticNumber: true,
                        titlePercent: 25,
                        labelPercent: 55,
                        labelCountPercent: 20,
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CustomOtmContainer(
              child: ShowLoadingWidget(
                title: AppLocalizations.of(context)!.courses,
                titleColor: AppColors.professionalDecorativeColor,
              ),
            ),
          );
        }
      },
    );
  }
}

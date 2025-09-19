import 'package:stat_edu_mobile/sources.dart';

class StudentsCourseDegreeType extends StatelessWidget {
  const StudentsCourseDegreeType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsControllerBloc, StudentsControllerState>(
      builder: (context, state) {
        if (state.studentsCoursesStatisticData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              state.studentsCoursesStatisticData
                  .map((value) => value.eduType)
                  .toSet()
                  .toList()
                  .length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CustomOtmContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getTranslateWord(context: context, value: state.studentsCoursesStatisticData
                              .map((value) => value.eduType)
                              .toSet()
                              .toList()[index],),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ShowStatisticChart(
                          statisticTitles: state.studentsCoursesStatisticData.where((value) => value.eduType == state.studentsCoursesStatisticData
                              .map((value) => value.eduType)
                              .toSet()
                              .toList()[index]).toList().map((value) => value.name).toList(),
                          statisticLabelColor: AppColors.circleStatisticBlueChart,
                          statisticItemNumber: state.studentsCoursesStatisticData.where((value) => value.eduType == state.studentsCoursesStatisticData
                              .map((value) => value.eduType)
                              .toSet()
                              .toList()[index]).toList().map((value) => value.count).toList(),
                          statisticItemNumberBorderColors: Colors.grey.shade50,
                          statisticItemNumberColor:
                              AppColors.circleStatisticBlueChart,
                          statisticLineCount: 5,
                          labelHeight: 30,
                          statisticLineColor: Colors.grey.shade300,
                          showBottomStatisticNumber: true,
                          titlePercent: 20,
                          labelPercent: 60,
                          labelCountPercent: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

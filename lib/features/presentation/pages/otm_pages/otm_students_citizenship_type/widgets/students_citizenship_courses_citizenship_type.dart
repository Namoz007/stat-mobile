import 'package:stat_edu_mobile/sources.dart';

class StudentsCitizenshipCoursesCitizenshipType extends StatefulWidget {
  const StudentsCitizenshipCoursesCitizenshipType({super.key});

  @override
  State<StudentsCitizenshipCoursesCitizenshipType> createState() =>
      _StudentsCitizenshipCoursesCitizenshipTypeState();
}

class _StudentsCitizenshipCoursesCitizenshipTypeState
    extends State<StudentsCitizenshipCoursesCitizenshipType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsCitizenshipBloc>().add(
      GetCoursesStudentsCitizenshipEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsCitizenshipBloc, StudentsCitizenshipState>(
      builder: (context, state) {


        if (state.studentsCoursesData.isNotEmpty) {
          Map<String, Color> courses = {};
          state.studentsCoursesData
              .map((value) => value.name)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) => courses[value] = AppColors.allColors[key],
              );
          return Column(
            children: List.generate(
              state.studentsCoursesData
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
                          "${AppLocalizations.of(context)!.courses}: ${getTranslateWord(context: context, value: state.studentsCoursesData.map((value) => value.eduType).toSet().toList()[index])}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ShowStatisticChart(
                          statisticTitles: state.studentsCoursesData.where((value) => value.eduType == state.studentsCoursesData.map((value) => value.eduType).toSet().toList()[index]).map((value) => value.name).toSet().toList(),
                          statisticLabelColor: AppColors.circleStatisticBlueChart,
                          statisticItemNumber: state.studentsCoursesData.where((value) => value.eduType == state.studentsCoursesData.map((value) => value.eduType).toSet().toList()[index]).map((value) => value.count).toList(),
                          statisticItemNumberBorderColors: Colors.grey.shade50,
                          statisticItemNumberColor: AppColors.circleStatisticBlueChart,
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
          return CustomOtmContainer(child: ShowLoadingWidget(title: AppLocalizations.of(context)!.courses, titleColor: AppColors.otmStudentsPageDecorativeColor));
        }
      },
    );
  }
}

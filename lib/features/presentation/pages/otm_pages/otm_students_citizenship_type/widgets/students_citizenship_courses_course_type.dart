import 'package:stat_edu_mobile/sources.dart';

class StudentsCitizenshipCoursesCourseType extends StatefulWidget {
  const StudentsCitizenshipCoursesCourseType({super.key});

  @override
  State<StudentsCitizenshipCoursesCourseType> createState() =>
      _StudentsCitizenshipCoursesCourseTypeState();
}

class _StudentsCitizenshipCoursesCourseTypeState
    extends State<StudentsCitizenshipCoursesCourseType> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsCitizenshipBloc, StudentsCitizenshipState>(
      builder: (context, state) {


        if (state.studentsCoursesData.isNotEmpty) {
          Map<String, Color> data = {};
          state.studentsCoursesData
              .map((value) => value.eduType)
              .toSet()
              .toList()
              .asMap()
              .forEach((key, value) => data[value] = AppColors.allColors[key]);
          return CustomOtmContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.courses,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.otmStudentsPageDecorativeColor,
                  ),
                ),
                const SizedBox(height: 12),
                ShowMultiStatisticChart(
                  statisticTitles:
                      state.studentsCoursesData
                          .map((value) => value.name)
                          .toSet()
                          .toList(),
                  statisticLabelColor: [
                    for (var i
                        in state.studentsCoursesData
                            .map((value) => value.name)
                            .toSet()
                            .toList())
                      [
                        for (var v in state.studentsCoursesData)
                          if (i == v.name) data[v.eduType]!,
                      ],
                  ],
                  statisticItemNumber: [
                    for (var i
                        in state.studentsCoursesData
                            .map((value) => value.name)
                            .toSet()
                            .toList())
                      [
                        for (var v in state.studentsCoursesData)
                          if (i == v.name) v.count,
                      ],
                  ],
                  statisticItemNumberBorderColors: [],
                  statisticItemNumberColor: [
                    for (var i
                        in state.studentsCoursesData
                            .map((value) => value.name)
                            .toSet()
                            .toList())
                      [
                        for (var v in state.studentsCoursesData)
                          if (i == v.name) data[v.eduType]!,
                      ],
                  ],
                  statisticLineCount: 5,
                  labelHeight: 30,
                  statisticLineColor: Colors.grey.shade300,
                  showBottomStatisticNumber: true,
                ),
                ShowRectangleTitle(
                  title: data.keys.map((value) => getTranslateWord(context: context, value: value)).toList(),
                  colors: data.values.toList(),
                  titleColor: AppColors.otmStudentsPageDecorativeColor,
                ),
                const SizedBox(height: 10,)
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomOtmContainer(child: ShowLoadingWidget(title: AppLocalizations.of(context)!.courses, titleColor: AppColors.otmStudentsPageDecorativeColor)),
          );
        }
      },
    );
  }
}

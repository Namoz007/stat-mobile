import 'package:stat_edu_mobile/sources.dart';

class StudentsEducationCoursesType extends StatefulWidget {
  const StudentsEducationCoursesType({super.key});

  @override
  State<StudentsEducationCoursesType> createState() =>
      _StudentsEducationCoursesTypeState();
}

class _StudentsEducationCoursesTypeState
    extends State<StudentsEducationCoursesType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsEducationFormControllerBloc>().add(
      GetCoursesStudentsEducationFormControllerEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      StudentsEducationFormControllerBloc,
      StudentsEducationFormControllerState
    >(
      builder: (context, state) {

        if (state.studentsEducationCourses.isNotEmpty) {
          return ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            physics: const ScrollPhysics(),
            itemCount: state.studentsEducationCourses.map((value) => value.eduType).toSet().toList().length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomOtmContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.courses}: ${getTranslateWord(context: context, value: state.studentsEducationCourses.map((value) => value.eduType).toSet().toList()[index])} ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.otmStudentsPageDecorativeColor,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 12),
                      state.studentsEducationCourses.isEmpty
                          ? const Center(child: Text("Ma'lumotlar topilmadi!"))
                          : ShowStatisticChart(
                            statisticTitles: [
                              for (var v in state.studentsEducationCourses)
                                if (state.studentsEducationCourses
                                        .map((value) => value.eduType)
                                        .toSet()
                                        .toList()[index] ==
                                    v.eduType)
                                  v.name,
                            ].reversed.toList(),
                            statisticLabelColor:
                                AppColors.circleStatisticBlueChart,
                            statisticItemNumber: [
                              for (var v in state.studentsEducationCourses)
                                if (state.studentsEducationCourses
                                        .map((value) => value.eduType)
                                        .toSet()
                                        .toList()[index] ==
                                    v.eduType)
                                  v.count,
                            ].reversed.toList(),
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
          );
        } else {
          return CustomOtmContainer(child: ShowLoadingWidget(title: AppLocalizations.of(context)!.courses, titleColor: AppColors.otmStudentsPageDecorativeColor,));
        }
      },
    );
  }
}

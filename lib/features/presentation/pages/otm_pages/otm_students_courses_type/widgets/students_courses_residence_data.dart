import 'package:stat_edu_mobile/sources.dart';

class StudentsCoursesResidenceData extends StatefulWidget {
  const StudentsCoursesResidenceData({super.key});

  @override
  State<StudentsCoursesResidenceData> createState() =>
      _StudentsCoursesResidenceDataState();
}

class _StudentsCoursesResidenceDataState
    extends State<StudentsCoursesResidenceData> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsCoursesBloc>().add(
      GetResidenceStudentsCourseEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsCoursesBloc, StudentsCoursesState>(
      builder: (context, state) {


        if (state.studentsByResidence.isNotEmpty) {
          Map<String, Color> data = {};
          state.studentsByResidence
              .map((value) => value.name)
              .toSet()
              .toList()
              .asMap()
              .forEach((key, value) => data[value] = AppColors.allColors[key]);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              state.studentsByResidence
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
                          "${AppLocalizations.of(context)!.residenceRegion}: ${getTranslateWord(context: context, value: state.studentsByResidence.map((value) => value.eduType).toSet().toList()[index])}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ShowStatisticChart(
                          statisticTitles: state.studentsByResidence
                              .where(
                                (value) =>
                            value.eduType ==
                                state.studentsByResidence
                                    .map((value) => value.eduType)
                                    .toSet()
                                    .toList()[index],
                          )
                              .toList()
                              .map((value) => value.name)
                              .toSet()
                              .toList(),
                          statisticLabelColor: AppColors.circleStatisticBlueChart,
                          statisticItemNumber: [
                            for(var i in state.studentsByResidence.where((value) => value.eduType == state.studentsByResidence.map((value) => value.eduType).toSet().toList()[index],).toList().map((value) => value.name).toSet().toList())
                              for(var z in state.studentsByResidence)
                                if(i == z.name && state.studentsByResidence.map((value) => value.eduType).toSet().toList()[index] == z.eduType)
                                  z.count
                          ],
                          statisticItemNumberBorderColors: Colors.grey.shade50,
                          statisticItemNumberColor:
                              AppColors.circleStatisticBlueChart,
                          statisticLineCount: 5,
                          labelHeight: 30,
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
              },
            ),
          );
        } else {
          return CustomOtmContainer(child: ShowLoadingWidget(title: AppLocalizations.of(context)!.residenceRegion, titleColor: AppColors.otmStudentsPageDecorativeColor));
        }
      },
    );
  }
}

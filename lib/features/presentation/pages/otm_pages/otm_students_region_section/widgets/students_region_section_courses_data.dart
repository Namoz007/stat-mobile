import 'package:stat_edu_mobile/sources.dart';

class StudentsRegionSectionCoursesData extends StatefulWidget {
  const StudentsRegionSectionCoursesData({super.key});

  @override
  State<StudentsRegionSectionCoursesData> createState() =>
      _StudentsRegionSectionCoursesDataState();
}

class _StudentsRegionSectionCoursesDataState
    extends State<StudentsRegionSectionCoursesData> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsRegionSectionBloc>().add(
      GetCoursesStudentsRegionSectionEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsRegionSectionBloc, StudentsRegionSectionState>(
      builder: (context, state) {

        if(state.loading || state.studentsCoursesData.isEmpty){
          return CustomOtmContainer(child: ShowLoadingWidget(title: AppLocalizations.of(context)!.courses, titleColor: AppColors.otmStudentsPageDecorativeColor));
        }

        if (state.studentsCoursesData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              state.studentsCoursesData
                  .map((value) => value.region)
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
                          "${AppLocalizations.of(context)!.courses}:${getTranslateWord(context: context, value: state.studentsCoursesData
                              .map((value) => value.region)
                              .toSet()
                              .toList()[index])}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ShowStatisticChart(
                          statisticTitles: state.studentsCoursesData.where((value) => value.region == state.studentsCoursesData
                              .map((value) => value.region)
                              .toSet()
                              .toList()[index]).toList().map((value) => value.name).toSet().toList(),
                          statisticLabelColor: AppColors.circleStatisticBlueChart,
                          statisticItemNumber: [
                            for(var i in state.studentsCoursesData.where((value) => value.region == state.studentsCoursesData.map((value) => value.region).toSet().toList()[index]).toList().map((value) => value.name).toSet().toList())
                              for(var z in state.studentsCoursesData)
                                if(i == z.name && z.region == state.studentsCoursesData
                                    .map((value) => value.region)
                                    .toSet()
                                    .toList()[index])
                                  z.count
                          ],
                          statisticItemNumberBorderColors: Colors.grey.shade50,
                          statisticItemNumberColor:
                              AppColors.circleStatisticBlueChart,
                          statisticLineCount: 5,
                          labelHeight: 30,
                          statisticLineColor: Colors.grey.shade300,
                          showBottomStatisticNumber: true,
                          labelCountPercent: 20,
                          titlePercent: 20,
                          labelPercent: 60,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Center(child: Text("Ma'lumotlar topilmadi!"));
        }
      },
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class StudentsAgeResidenceData extends StatefulWidget {
  const StudentsAgeResidenceData({super.key});

  @override
  State<StudentsAgeResidenceData> createState() =>
      _StudentsAgeResidenceDataState();
}

class _StudentsAgeResidenceDataState extends State<StudentsAgeResidenceData> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsAgeResidenceBloc>().add(
      GetResidenceStudentsAgeResidenceEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsAgeResidenceBloc, StudentsAgeResidenceState>(
      builder: (context, state) {

        if(state.studentsResidenceData.isEmpty || state.loading){
          return CustomOtmContainer(child: ShowLoadingWidget(title: AppLocalizations.of(context)!.residenceRegion, titleColor: AppColors.otmStudentsPageDecorativeColor));
        }

        if (state.studentsResidenceData.isNotEmpty) {
          Map<String, Color> residenceData = {};
          state.studentsResidenceData
              .map((value) => value.name)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) => residenceData[value] = AppColors.allColors[key],
          );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              state.studentsResidenceData
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
                          "${AppLocalizations.of(context)!.residenceRegion}: ${getTranslateWord(context: context, value: formatAgeWithKey(
                              state.studentsResidenceData.map((value) =>
                              value.eduType).toSet().toList()[index]))}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ShowStatisticChart(
                          statisticTitles: state.studentsResidenceData
                              .where((
                              value) =>
                          value.eduType ==
                              state.studentsResidenceData.map((value) =>
                              value.eduType).toSet().toList()[index])
                              .toList()
                              .map((value) => value.name)
                              .toSet()
                              .toList(),
                          statisticLabelColor: AppColors
                              .circleStatisticBlueChart,
                          statisticItemNumber: state.studentsResidenceData.where((value) => value.eduType == state.studentsResidenceData.map((value) => value.eduType).toSet().toList()[index]).map((value) => value.count).toList(),
                          statisticItemNumberBorderColors
                          : Colors.grey.shade50,
                          statisticItemNumberColor: AppColors
                              .circleStatisticBlueChart, statisticLineCount: 5,
                          labelHeight: 30, statisticLineColor: Colors.grey
                            .shade300, showBottomStatisticNumber: true,
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
          return Center(child: Text("Ma'lumotlar topilmadi!"));
        }
      },
    );
  }
}

import "package:stat_edu_mobile/sources.dart";

class StudentsEducationResidenceAreaType extends StatefulWidget {
  const StudentsEducationResidenceAreaType({super.key});

  @override
  State<StudentsEducationResidenceAreaType> createState() =>
      _StudentsEducationResidenceAreaTypeState();
}

class _StudentsEducationResidenceAreaTypeState
    extends State<StudentsEducationResidenceAreaType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsEducationFormControllerBloc>().add(
      GetResidenceStudentsEducationFormControllerEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      StudentsEducationFormControllerBloc,
      StudentsEducationFormControllerState
    >(
      builder: (context, state) {

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
          return ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.all(0),
            itemCount:
                state.studentsResidenceData
                    .map((value) => value.eduType)
                    .toSet()
                    .toList()
                    .length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomOtmContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.residenceRegion}: ${state.studentsResidenceData.map((value) => value.eduType).toSet().toList()[index]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.otmStudentsPageDecorativeColor,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ShowStatisticChart(
                        statisticTitles: [
                          for (var i in state.studentsResidenceData)
                            if (state.studentsResidenceData
                                    .map((value) => value.eduType)
                                    .toSet()
                                    .toList()[index] ==
                                i.eduType)
                              i.name,
                        ],
                        statisticLabelColor: AppColors.circleStatisticBlueChart,
                        statisticItemNumber: [
                          for (var i in state.studentsResidenceData)
                            if (state.studentsResidenceData
                                    .map((value) => value.eduType)
                                    .toSet()
                                    .toList()[index] ==
                                i.eduType)
                              i.count,
                        ],
                        statisticItemNumberBorderColors: Colors.grey.shade50,
                        statisticItemNumberColor:
                            AppColors.circleStatisticBlueChart,
                        statisticLineCount: 5,
                        labelHeight: 30,
                        statisticLineColor: Colors.grey.shade300,
                        showBottomStatisticNumber: true,
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomOtmContainer(
              child: ShowLoadingWidget(
                title: AppLocalizations.of(context)!.residenceRegion,
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
            ),
          );
        }
      },
    );
  }
}

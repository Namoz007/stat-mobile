import 'package:stat_edu_mobile/sources.dart';

class TeachersEducationType extends StatefulWidget {
  const TeachersEducationType({super.key});

  @override
  State<TeachersEducationType> createState() => _TeachersEducationTypeState();
}

class _TeachersEducationTypeState extends State<TeachersEducationType> {
  @override
  void initState() {
    super.initState();
    context.read<TeachersControllerBloc>().add(
      GetEducationRankTeachersControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersControllerBloc, TeachersControllerState>(
      builder: (context, state) {
        if (state.teachersEducationRankTypeData.isNotEmpty) {
          Map<String, Color> teachersData = {
            AppLocalizations.of(context)!.noDegree: AppColors.amberCircleChartColor,
            AppLocalizations.of(context)!.hasDegree: AppColors.lightGreenChartColor,
          };
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.teachersByScientificQualification,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.decorativeColor,
                ),
              ),
              const SizedBox(height: 34),
              Center(
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: ShowCircleStatistic(
                    percents: [
                      calculatePercent(
                        state.teachersEducationRankTypeData
                            .map((value) => value.count)
                            .toList()
                            .reduce((a, b) => a + b),
                        state.teachersEducationRankTypeData
                            .where(
                              (value) =>
                                  value.name.toLowerCase() == "darajasiz",
                            )
                            .toList()
                            .map((value) => value.count)
                            .toList()
                            .reduce((a, b) => a + b),
                      ),
                      calculatePercent(
                        state.teachersEducationRankTypeData
                            .map((value) => value.count)
                            .toList()
                            .reduce((a, b) => a + b),
                        state.teachersEducationRankTypeData
                            .where(
                              (value) =>
                                  value.name.toLowerCase() != "darajasiz",
                            )
                            .toList()
                            .map((value) => value.count)
                            .toList()
                            .reduce((a, b) => a + b),
                      ),
                    ],
                    percentTitles: [
                      "${(calculatePercent(state.teachersEducationRankTypeData.map((value) => value.count).toList().reduce((a, b) => a + b), state.teachersEducationRankTypeData.where((value) => value.name.toLowerCase() == "darajasiz").toList().map((value) => value.count).toList().reduce((a, b) => a + b)) * 100).toStringAsFixed(2)}%",
                      "${(calculatePercent(state.teachersEducationRankTypeData.map((value) => value.count).toList().reduce((a, b) => a + b), state.teachersEducationRankTypeData.where((value) => value.name.toLowerCase() != "darajasiz").toList().map((value) => value.count).toList().reduce((a, b) => a + b)) * 100).toStringAsFixed(2)}%",
                    ],
                    percentColors: teachersData.values.toList(),
                    percentRadius: [60, 60],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ShowRectangleTitle(
                title: teachersData.keys.toList(),
                colors: teachersData.values.toList(),
                titleColor: Colors.black,
              ),
              const SizedBox(height: 8,),
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.teachersByScientificQualification, titleColor: AppColors.decorativeColor,);
        }
      },
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class TeachersLeaderTypeStatistic extends StatefulWidget {
  const TeachersLeaderTypeStatistic({super.key});

  @override
  State<TeachersLeaderTypeStatistic> createState() =>
      _TeachersLeaderTypeStatisticState();
}

class _TeachersLeaderTypeStatisticState
    extends State<TeachersLeaderTypeStatistic> {
  @override
  void initState() {
    super.initState();
    context.read<TeachersControllerBloc>().add(
      GetTeacherLeaderDataTeachersControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersControllerBloc, TeachersControllerState>(
      builder: (context, state) {

        if (state.teachersLeaderData.isNotEmpty) {
          Map<String, Color> leaders = {};
          state.teachersLeaderData
              .map((value) => value.leaderName)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) => leaders[value] = AppColors.allColors[key],
              );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.director,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.decorativeColor,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: ShowCircleStatistic(
                    percents:
                        state.teachersLeaderData
                            .map((value) => value.count)
                            .toList()
                            .map(
                              (value) => calculatePercent(
                                state.teachersLeaderData
                                    .map((v) => v.count)
                                    .toList()
                                    .reduce((a, b) => a + b)
                                    .toInt(),
                                value,
                              ),
                            )
                            .toList(),
                    percentTitles:
                        state.teachersLeaderData
                            .map((value) => value.count)
                            .toList()
                            .map(
                              (value) => calculatePercent(
                                state.teachersLeaderData
                                    .map((v) => v.count)
                                    .toList()
                                    .reduce((a, b) => a + b)
                                    .toInt(),
                                value,
                              ),
                            )
                            .toList()
                            .map(
                              (value) => "${(value * 100).toStringAsFixed(2)}%",
                            )
                            .toList(),
                    percentColors:
                        state.teachersLeaderData
                            .map((value) => leaders[value.leaderName]!)
                            .toList(),
                    percentRadius:
                        state.teachersLeaderData.map((value) => 58.0).toList(),
                    centerTitle: formatNumber(
                      state.teachersLeaderData
                          .map((value) => value.count)
                          .toList()
                          .reduce((a, b) => a + b),
                    ),
                    centerTitleStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ShowRectangleTitle(
                title: leaders.keys.map((value) => getTranslateWord(context: context, value: value)).toList(),
                colors: leaders.values.toList(),
                titleColor: Colors.black,
              ),
              const SizedBox(height: 10,),
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.director, titleColor: AppColors.decorativeColor,);
        }
      },
    );
  }
}

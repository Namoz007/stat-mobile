import 'package:stat_edu_mobile/sources.dart';

class LaborFormStatisticType extends StatefulWidget {
  const LaborFormStatisticType({super.key});

  @override
  State<LaborFormStatisticType> createState() => _LaborFormStatisticTypeState();
}

class _LaborFormStatisticTypeState extends State<LaborFormStatisticType> {
  @override
  void initState() {
    super.initState();
    context.read<TeachersControllerBloc>().add(
      GetLaborFormStatisticDataTeachersControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersControllerBloc, TeachersControllerState>(
      builder: (context, state) {
        if (state.laborFormStatisticData.isNotEmpty) {
          Map<String, Color> laborData = {};
          state.laborFormStatisticData
              .map((value) => value.leaderName)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) => laborData[value] = AppColors.allColors[key],
              );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.byWorkType,
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
                    percents:
                        state.laborFormStatisticData
                            .map(
                              (value) => calculatePercent(
                                state.laborFormStatisticData
                                    .map((c) => c.count)
                                    .toList()
                                    .reduce((a, b) => a + b),
                                value.count,
                              ),
                            )
                            .toList(),
                    percentTitles:
                        state.laborFormStatisticData
                            .map(
                              (value) =>
                                  "${(calculatePercent(state.laborFormStatisticData.map((c) => c.count).toList().reduce((a, b) => a + b), value.count) * 100).toStringAsFixed(2)}%",
                            )
                            .toList(),
                    percentColors:
                        state.laborFormStatisticData
                            .map((value) => laborData[value.leaderName]!)
                            .toList(),
                    percentRadius:
                        state.laborFormStatisticData
                            .map((value) => 60.0)
                            .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ShowRectangleTitle(
                title: laborData.keys.toList(),
                colors: laborData.values.toList(),
                titleColor: Colors.black,
              ),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.byWorkType, titleColor: AppColors.decorativeColor);
        }
      },
    );
  }
}

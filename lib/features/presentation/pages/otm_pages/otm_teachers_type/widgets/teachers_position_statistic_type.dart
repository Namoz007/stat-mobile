import 'package:stat_edu_mobile/sources.dart';

class TeachersPositionStatisticType extends StatefulWidget {
  const TeachersPositionStatisticType({super.key});

  @override
  State<TeachersPositionStatisticType> createState() =>
      _TeachersPositionStatisticTypeState();
}

class _TeachersPositionStatisticTypeState
    extends State<TeachersPositionStatisticType> {
  @override
  void initState() {
    super.initState();
    context.read<TeachersControllerBloc>().add(
      GetPositionStatisticDataTeachersControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersControllerBloc, TeachersControllerState>(

      builder: (context, state) {
        if (state.positionStatisticData.isNotEmpty) {
          Map<String, Color> positionData = {};
          state.positionStatisticData
              .map((value) => value.leaderName)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) => positionData[value] = AppColors.allColors[key],
              );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.byPosition,
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
                    percents: positionData.keys.toList().map(
                      (value) =>
                          calculatePercent(state.positionStatisticData.map((v) => v.count).toList().reduce((a,b) => a + b), state.positionStatisticData[state.positionStatisticData.indexWhere((v) => v.leaderName == value)].count),
                    ).toList(),
                    percentTitles: positionData.keys.toList().map(
                          (value) =>
                          "${(calculatePercent(state.positionStatisticData.map((v) => v.count).toList().reduce((a,b) => a + b), state.positionStatisticData[state.positionStatisticData.indexWhere((v) => v.leaderName == value)].count) * 100).toStringAsFixed(2)}%",
                    ).toList(),
                    percentColors: state.positionStatisticData.map((value) => positionData[value.leaderName]!).toList(),
                    percentRadius: state.positionStatisticData.map((value) => 60.0).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ShowRectangleTitle(title: positionData.keys.map((value) => getTranslateWord(context: context, value: value)).toList(), colors: positionData.values.toList(), titleColor: Colors.black,),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.byPosition, titleColor: AppColors.decorativeColor);
        }
      },
    );
  }
}

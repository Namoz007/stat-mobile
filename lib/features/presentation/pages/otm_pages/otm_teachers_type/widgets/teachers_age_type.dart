import 'package:stat_edu_mobile/sources.dart';

class TeachersAgeType extends StatefulWidget {
  const TeachersAgeType({super.key});

  @override
  State<TeachersAgeType> createState() => _TeachersAgeTypeState();
}

class _TeachersAgeTypeState extends State<TeachersAgeType> {
  @override
  void initState() {
    super.initState();
    context.read<TeachersControllerBloc>().add(
      GetStatisticAgeDataTeachersControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersControllerBloc, TeachersControllerState>(
      builder: (context, state) {
        if (state.teachersAgeStatisticData.isNotEmpty) {
          Map<String, Color> ageData = {};
          state.teachersAgeStatisticData
              .map((value) => value.gender)
              .toSet()
              .toList()
              .asMap()
              .forEach((key, value) => ageData[value] = AppColors.colors1[key]);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.teachersByAge,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.decorativeColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  MultiStatisticTitle(
                    title: ageData.keys.toList(),
                    titleColors: ageData.values.toList(),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Divider(color: AppColors.decorativeColor),
              const SizedBox(height: 10),
              ShowMultiStatisticChart(
                statisticTitles: state.teachersAgeStatisticData.map((value) => value.name).toList(),
                statisticLabelColor: [
                  for(var i in state.teachersAgeStatisticData.map((value) => value.name).toList())
                    [
                      for(var z in state.teachersAgeStatisticData)
                        if(i == z.name)
                          ageData[z.gender]!
                    ]
                ],
                statisticItemNumber: [
                  for(var i in state.teachersAgeStatisticData.map((value) => value.name).toList())
                    [
                      for(var z in state.teachersAgeStatisticData)
                        if(i == z.name)
                          z.count
                    ]
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for(var i in state.teachersAgeStatisticData.map((value) => value.name).toList())
                    [
                      for(var z in state.teachersAgeStatisticData)
                        if(i == z.name)
                          ageData[z.gender]!
                    ]
                ],
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 25,
                labelCountPercent: 20,
                labelPercent: 55,
              ),
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.teachersByAge, titleColor: AppColors.decorativeColor);
        }
      },
    );
  }
}

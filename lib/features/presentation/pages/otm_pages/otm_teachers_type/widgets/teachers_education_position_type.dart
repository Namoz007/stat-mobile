import 'package:stat_edu_mobile/sources.dart';

class TeachersEducationPositionType extends StatefulWidget {
  const TeachersEducationPositionType({super.key});

  @override
  State<TeachersEducationPositionType> createState() =>
      _TeachersEducationPositionTypeState();
}

class _TeachersEducationPositionTypeState
    extends State<TeachersEducationPositionType> {
  @override
  void initState() {
    super.initState();
    context.read<TeachersControllerBloc>().add(
      GetPositionDataTeachersControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersControllerBloc, TeachersControllerState>(
      builder: (context, state) {
        if(state.teachersPositionData.isNotEmpty){
          Map<String,Color> teachersData = {};
          state.teachersPositionData.map((value) => value.gender).toSet().toList().asMap().forEach((key,value) => teachersData[value] = AppColors.colors1[key]);
          print(state.teachersPositionData.map((value) => value.name).toSet().toList());
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.teachersByTitle,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.decorativeColor,
                      ),
                    ),
                  ),
                  MultiStatisticTitle(
                    title: [AppLocalizations.of(context)!.male, AppLocalizations.of(context)!.female],
                    titleColors: [
                      AppColors.circleStatisticBlueChart,
                      AppColors.circleStatisticPinkChart,
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Divider(color: AppColors.decorativeColor),
              const SizedBox(height: 8),
              ShowMultiStatisticChart(
                statisticTitles: state.teachersPositionData.map((value) => value.name).toSet().toList(),
                statisticLabelColor: [
                  for(var i in state.teachersPositionData.map((value) => value.name).toSet().toList())
                    [
                      for(var z in state.teachersPositionData)
                        if(i == z.name)
                          teachersData[z.gender]!
                    ]
                ],
                statisticItemNumber: [
                  for(var i in state.teachersPositionData.map((value) => value.name).toSet().toList())
                    [
                      for(var z in state.teachersPositionData)
                        if(i == z.name)
                          z.count
                    ]
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for(var i in state.teachersPositionData.map((value) => value.name).toSet().toList())
                    [
                      for(var z in state.teachersPositionData)
                        if(i == z.name)
                          teachersData[z.gender]!
                    ]
                ],
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelPercent: 60,
                labelCountPercent: 20,
              ),
            ],
          );
        }else{
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.teachersByTitle, titleColor: AppColors.decorativeColor,);
        }
      },
    );
  }
}

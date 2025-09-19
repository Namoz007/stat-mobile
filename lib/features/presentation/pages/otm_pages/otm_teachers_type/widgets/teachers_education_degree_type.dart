import 'package:stat_edu_mobile/sources.dart';

class TeachersEducationDegreeType extends StatefulWidget {
  const TeachersEducationDegreeType({super.key});

  @override
  State<TeachersEducationDegreeType> createState() =>
      _TeachersEducationDegreeTypeState();
}

class _TeachersEducationDegreeTypeState extends State<TeachersEducationDegreeType> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersControllerBloc, TeachersControllerState>(
      builder: (context, state) {
        if (state.teachersEducationRankTypeData.isNotEmpty) {
          Map<String, Color> rankData = {};
          state.teachersEducationRankTypeData
              .map((value) => value.gender)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) => rankData[value] = AppColors.colors1[key],
              );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.teachersByDegree,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.decorativeColor,
                      ),
                    ),
                  ),
                  MultiStatisticTitle(
                    title: rankData.keys.map((value) => getTranslateWord(context: context, value: value)).toList(),
                    titleColors: rankData.values.toList(),
                  ),
                ],
              ),
              Divider(color: AppColors.decorativeColor),
              const SizedBox(height: 8),
              ShowMultiStatisticChart(
                statisticTitles: state.teachersEducationRankTypeData.map((value) => value.name).toSet().toList(),
                statisticLabelColor: [
                  for(var i in state.teachersEducationRankTypeData.map((value) => value.name).toSet().toList())
                    [
                      for(var z in state.teachersEducationRankTypeData)
                        if(i == z.name)
                          rankData[z.gender]!
                    ]
                ],
                statisticItemNumber: [
                  for(var i in state.teachersEducationRankTypeData.map((value) => value.name).toSet().toList())
                    [
                      for(var z in state.teachersEducationRankTypeData)
                        if(i == z.name)
                          z.count
                    ]
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for(var i in state.teachersEducationRankTypeData.map((value) => value.name).toSet().toList())
                    [
                      for(var z in state.teachersEducationRankTypeData)
                        if(i == z.name)
                          rankData[z.gender]!
                    ]
                ],
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
              ),
              const SizedBox(height: 8,),
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.teachersByDegree, titleColor: AppColors.decorativeColor,);
        }
      },
    );
  }
}

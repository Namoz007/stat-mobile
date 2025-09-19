import 'package:stat_edu_mobile/sources.dart';

class TeachersGenderType extends StatefulWidget {
  const TeachersGenderType({super.key});

  @override
  State<TeachersGenderType> createState() => _TeachersGenderTypeState();
}

class _TeachersGenderTypeState extends State<TeachersGenderType> {
  @override
  void initState() {
    super.initState();
    context.read<TeachersControllerBloc>().add(
      GetTeacherGenderDataTeachersControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersControllerBloc, TeachersControllerState>(
      builder: (context, state) {
        if (state.teachersGenderData.isNotEmpty) {
          Map<String, Color> genderData = {};
          state.teachersGenderData
              .map((value) => value.leaderName)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) => genderData[value] = AppColors.colors1[key],
              );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(
                    AppLocalizations.of(context)!.teachersByGender,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.decorativeColor,
                    ),
                  ),),
                  MultiStatisticTitle(title: genderData.keys.map((value) => getTranslateWord(context: context, value: value)).toList(), titleColors: genderData.values.toList(),),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: ShowCircleStatistic(
                    percents: genderData.keys.toList().map(
                      (value) => calculatePercent(
                        state.teachersGenderData
                            .map((i) => i.count)
                            .toList()
                            .reduce((a, b) => a + b),
                        state.teachersGenderData
                            .where((v) => v.leaderName == value)
                            .toList()
                            .map((v) => v.count)
                            .toList()
                            .reduce((a, b) => a + b),
                      ),
                    ).toList(),
                    percentTitles: genderData.keys.toList().map((value) => '').toList(),
                    percentColors: genderData.values.toList(),
                    percentRadius:
                        genderData.keys.toList().map((value) => 60.0).toList(),
                    centerTitle: formatNumber(state.teachersGenderData.map((value) => value.count).toList().reduce((a,b) => a + b)),
                    centerTitleStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: AppLocalizations.of(context)!.teachersByGender,
            titleColor: AppColors.decorativeColor,
          );
        }
      },
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class CitizenLaborFormStatisticType extends StatefulWidget {
  const CitizenLaborFormStatisticType({super.key});

  @override
  State<CitizenLaborFormStatisticType> createState() =>
      _CitizenLaborFormStatisticTypeState();
}

class _CitizenLaborFormStatisticTypeState
    extends State<CitizenLaborFormStatisticType> {
  @override
  void initState() {
    super.initState();
    context.read<TeachersControllerBloc>().add(
      GetCitizenStatisticDataTeachersControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeachersControllerBloc, TeachersControllerState>(
      builder: (context, state) {
        if (state.citizenLaborFormData.isNotEmpty) {
          Map<String, Color> citizenshipData = {};
          state.citizenLaborFormData
              .map((value) => value.leaderName)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) =>
                    citizenshipData[value] = AppColors.allColors[key],
              );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.citizenshipByWorkType,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.decorativeColor,
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: ShowCircleStatistic(
                    percents:
                        state.citizenLaborFormData
                            .map(
                              (value) => calculatePercent(
                                state.citizenLaborFormData
                                    .map((v) => v.count)
                                    .toList()
                                    .reduce((a, b) => a + b),
                                value.count,
                              ),
                            )
                            .toList(),
                    percentTitles:
                        state.citizenLaborFormData
                            .map(
                              (value) => (calculatePercent(
                                        state.citizenLaborFormData
                                            .map((v) => v.count)
                                            .toList()
                                            .reduce((a, b) => a + b),
                                        value.count,
                                      ) *
                                      100)
                                  .toStringAsFixed(2),
                            )
                            .toList(),
                    percentColors:
                        state.citizenLaborFormData
                            .map((value) => citizenshipData[value.leaderName]!)
                            .toList(),
                    percentRadius:
                        state.citizenLaborFormData
                            .map((value) => 60.0)
                            .toList(),
                    showPercentIcon: true,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ShowRectangleTitle(
                title:
                    citizenshipData.keys
                        .toList()
                        .map(
                          (value) =>
                              "${getTranslateWord(context: context, value: value)} ${(calculatePercent(state.citizenLaborFormData.map((v) => v.count).toList().reduce((a,b) => a + b), state.citizenLaborFormData.where((v) => v.leaderName == value).toList().map((i) => i.count).toList().reduce((a,b) => a + b)) * 100).toStringAsFixed(2)}%",
                        )
                        .toList(),
                colors: citizenshipData.values.toList(),
                titleColor: Colors.black,
              ),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.citizenshipByWorkType, titleColor: AppColors.decorativeColor);
        }
      },
    );
  }
}

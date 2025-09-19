import 'package:stat_edu_mobile/sources.dart';

class DoctoralStudiesProvinceDoctoralAndLeadersCountData
    extends StatefulWidget {
  const DoctoralStudiesProvinceDoctoralAndLeadersCountData({super.key});

  @override
  State<DoctoralStudiesProvinceDoctoralAndLeadersCountData> createState() =>
      _DoctoralStudiesProvinceDoctoralAndLeadersCountDataState();
}

class _DoctoralStudiesProvinceDoctoralAndLeadersCountDataState
    extends State<DoctoralStudiesProvinceDoctoralAndLeadersCountData> {
  @override
  void initState() {
    super.initState();
    context.read<DoctoralStudiesControllerBloc>().add(
      GetProvinceAndDoctoralCountDataDoctoralStudiesControllerEvent(
        update: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      DoctoralStudiesControllerBloc,
      DoctoralStudiesControllerState
    >(
      builder: (context, state) {
        if (state.provinceDoctoralAndLeadersData.isNotEmpty) {
          return BlocProvider(
            create: (context) => getIt<ProfessionalTabbarControllerCubit>(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Viloyatdagi doktorantlar va ilmiy rahbarlar soni",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                BlocBuilder<
                  ProfessionalTabbarControllerCubit,
                  ProfessionalTabBarControllerState
                >(
                  builder: (context, indexState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CategoryTabbarItem(
                                hintText: "ITM",
                                isCurrent: indexState.index == 0,
                                index: 0,
                                onTap: () {
                                  if (indexState.index != 0) {
                                    context
                                        .read<
                                          ProfessionalTabbarControllerCubit
                                        >()
                                        .newIndex(0);
                                  }
                                },
                              ),
                            ),
                            Expanded(
                              child: CategoryTabbarItem(
                                hintText: "OTM",
                                isCurrent: indexState.index == 1,
                                index: 1,
                                onTap: () {
                                  if (indexState.index != 1) {
                                    context
                                        .read<
                                          ProfessionalTabbarControllerCubit
                                        >()
                                        .newIndex(1);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ilmiy rahbarlar soni",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ShowStatisticChart(
                              statisticTitles:
                                  state.provinceDoctoralAndLeadersData
                                      .map((value) => value.names.uz)
                                      .toList(),
                              statisticLabelColor:
                                  AppColors.circleStatisticBlueChart,
                              statisticItemNumber: state.provinceDoctoralAndLeadersData.map((value) => indexState.index == 0 ? value.researcher_itm_count : value.researcher_otm_count,).toList(),
                              statisticItemNumberBorderColors:
                                  Colors.grey.shade50,
                              statisticItemNumberColor:
                                  AppColors.circleStatisticBlueChart,
                              statisticLineCount: 5,
                              labelHeight: 30,
                              statisticLineColor: Colors.grey.shade300,
                              showBottomStatisticNumber: true,
                            ),
                            Divider(color: Colors.black),
                            Text(
                              "Doktorantlar soni",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ShowStatisticChart(
                              statisticTitles: state.provinceDoctoralAndLeadersData.map((value) => value.names.uz).toList(),
                              statisticLabelColor: AppColors.circleStatisticBlueChart,
                              statisticItemNumber: state.provinceDoctoralAndLeadersData.map((value) => indexState.index == 0 ? value.apply_doc_itm_count : value.apply_doc_otm_count).toList(),
                              statisticItemNumberBorderColors: Colors.grey.shade50,
                              statisticItemNumberColor: AppColors.circleStatisticBlueChart,
                              statisticLineCount: 5,
                              labelHeight: 30,
                              statisticLineColor: Colors.grey.shade300,
                              showBottomStatisticNumber: true,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 12),
              ],
            ),
          );
        } else {
          return ShowLoadingWidget(
            title: "Viloyatdagi doktorantlar va ilmiy rahbarlar soni",
            titleColor: Colors.black,
          );
        }
      },
    );
  }
}

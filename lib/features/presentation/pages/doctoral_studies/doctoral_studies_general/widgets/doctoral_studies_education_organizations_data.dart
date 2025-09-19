import 'package:stat_edu_mobile/sources.dart';

class DoctoralStudiesEducationOrganizationsData extends StatefulWidget {
  const DoctoralStudiesEducationOrganizationsData({super.key});

  @override
  State<DoctoralStudiesEducationOrganizationsData> createState() => _DoctoralStudiesEducationOrganizationsDataState();
}

class _DoctoralStudiesEducationOrganizationsDataState extends State<DoctoralStudiesEducationOrganizationsData> {
  
  @override
  void initState() {
    super.initState();
    context.read<DoctoralStudiesControllerBloc>().add(GetProvinceOTMAndEducationOrganizationDataDoctoralStudiesControllerEvent(update: false));
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      DoctoralStudiesControllerBloc,
      DoctoralStudiesControllerState
    >(
      builder: (context, state) {
        if (state.provinceOTMAndOrganizationsData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Viloyatdagi OTMlar va ilmiy tashkilotlar soni",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              const SizedBox(height: 12),
              ShowMultiStatisticChart(
                statisticTitles: state.provinceOTMAndOrganizationsData.map((value) => value.names.uz).toList(),
                statisticLabelColor: state.provinceOTMAndOrganizationsData.map((value) => value.names.uz).toList().map((value) => [AppColors.amberCircleChartColor,AppColors.greenBarChart,]).toList(),
                statisticItemNumber: state.provinceOTMAndOrganizationsData.map((value) => [value.otmOrganization,value.educationOrganization,]).toList(),
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: state.provinceOTMAndOrganizationsData.map((value) => value.names.uz).toList().map((value) => [AppColors.amberCircleChartColor,AppColors.greenBarChart,]).toList(),
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 25,
                labelPercent: 55,
                labelCountPercent: 20,
              ),
              ShowRectangleTitle(title: ["Oliy ta'im muassasasi","Ilmiy tashkilot"], colors: [AppColors.amberCircleChartColor,AppColors.greenBarChart,], titleColor: Colors.black,),
              const SizedBox(height: 12,),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: "Viloyatdagi OTMlar va ilmiy tashkilotlar soni",
            titleColor: Colors.black,
          );
        }
      },
    );
  }
}

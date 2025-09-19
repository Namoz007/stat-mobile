import 'package:stat_edu_mobile/sources.dart';

class ProfessionalCoursesResidenceData extends StatelessWidget {
  const ProfessionalCoursesResidenceData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalEducationBloc, ProfessionalEducationState>(
      builder: (context, state) {
        if(state.coursesData.residenceData.isNotEmpty){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.residenceRegion,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: AppColors.professionalDecorativeColor,),),
              const SizedBox(height: 12,),
              StatisticTitleCount(title: [
        AppLocalizations.of(context)!.ownHouse,
        AppLocalizations.of(context)!.dormitory,
        AppLocalizations.of(context)!.rentedHouse,
        AppLocalizations.of(context)!.relativeHouse,
        AppLocalizations.of(context)!.friendHouse,
        AppLocalizations.of(context)!.other,
              ],
                count: [
                state.coursesData.residenceData.map((value) => value.houseLiveCount).toList().reduce((a,b) => a + b),
                state.coursesData.residenceData.map((value) => value.studentsHouseLiveCount).toList().reduce((a,b) => a + b),
                state.coursesData.residenceData.map((value) => value.rentalHouseLiveCount).toList().reduce((a,b) => a + b),
                state.coursesData.residenceData.map((value) => value.relativeHouseLiveCount).toList().reduce((a,b) => a + b),
                state.coursesData.residenceData.map((value) => value.familiarHouseLiveCount).toList().reduce((a,b) => a + b),
                state.coursesData.residenceData.map((value) => value.otherLiveCount).toList().reduce((a,b) => a + b),
              ], titleColor: Colors.black, countColor: AppColors.professionalDecorativeColor, titleSize: 16, countSize: 18, alignment: MainAxisAlignment.spaceEvenly, isWrap: true,),
              const SizedBox(height: 12,),
              ShowMultiStatisticChart(
                statisticTitles: state.coursesData.residenceData.map((value) => "${value.education_type}-kurs").toList(),
                statisticLabelColor: state.coursesData.residenceData.map((value) => "${value.education_type}-kurs").toList().map((value) => [
                  AppColors.amberCircleChartColor,
                  AppColors.circleStatisticBlueChart,
                  AppColors.professionalForeignInstitutionColor,
                  AppColors.greenBarChart,
                  AppColors.circleStatisticPinkChart,
                  AppColors.mainColor,
                ]).toList(),
                statisticItemNumber: [
                  for(var i in state.coursesData.residenceData.map((value) => value.education_type).toList())
                    for(var z in state.coursesData.residenceData)
                      if(i == z.education_type)
                        [z.houseLiveCount,z.studentsHouseLiveCount,z.rentalHouseLiveCount,z.relativeHouseLiveCount,z.familiarHouseLiveCount,z.otherLiveCount,]
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: state.coursesData.residenceData.map((value) => "${value.education_type}-kurs").toList().map((value) => [
                  AppColors.amberCircleChartColor,
                  AppColors.circleStatisticBlueChart,
                  AppColors.professionalForeignInstitutionColor,
                  AppColors.greenBarChart,
                  AppColors.circleStatisticPinkChart,
                  AppColors.mainColor,
                ]).toList(),
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
                titlePercent: 20,
                labelPercent: 60,
                labelCountPercent: 20,
              ),
              ShowRectangleTitle(
                title: [
        AppLocalizations.of(context)!.ownHouse,
        AppLocalizations.of(context)!.dormitory,
        AppLocalizations.of(context)!.rentedHouse,
        AppLocalizations.of(context)!.relativeHouse,
        AppLocalizations.of(context)!.friendHouse,
        AppLocalizations.of(context)!.other,
                ],
                colors: [
                  AppColors.amberCircleChartColor,
                  AppColors.circleStatisticBlueChart,
                  AppColors.professionalForeignInstitutionColor,
                  AppColors.greenBarChart,
                  AppColors.circleStatisticPinkChart,
                  AppColors.mainColor,
                ],
                titleColor: AppColors.professionalDecorativeColor,
              ),
              const SizedBox(height: 12,),
            ],
          );
        }else{
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.residenceRegion, titleColor: AppColors.professionalDecorativeColor);
        }
      },
    );
  }
}

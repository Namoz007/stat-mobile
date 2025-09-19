import 'package:stat_edu_mobile/sources.dart';

class StudentsMenuStatistics extends StatefulWidget {
  const StudentsMenuStatistics({super.key});

  @override
  State<StudentsMenuStatistics> createState() => _StudentsMenuStatisticsState();
}

class _StudentsMenuStatisticsState extends State<StudentsMenuStatistics> {
  
  @override
  void initState() {
    super.initState();
    context.read<StudentsControllerBloc>().add(GetEducationTypeStatisticStudentsControllerEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsControllerBloc,StudentsControllerState>(
      builder: (context, state) {
        
        if(state.studentsEducationTypeStatisticData.isEmpty){
          return CustomOtmContainer(child: ShowLoadingWidget(title: AppLocalizations.of(context)!.ordinatura, titleColor: AppColors.otmStudentsPageDecorativeColor));
        }
        
        if(state.studentsEducationTypeStatisticData.isNotEmpty){
          
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ShowOtmData(
                        title: AppLocalizations.of(context)!.ordinatura,
                        decorativeColor:
                        AppColors.otmStudentsPageDecorativeColor,
                        iconName: AppSvgs.studentsResidencyIcon,
                        count: state.studentsEducationTypeStatisticData.where((value) => value.eduType == "Ordinatura").toList().map((value) => value.count).toList().reduce((a,b) => a + b),
                        dataNumber: [
                          for(var i in state.studentsEducationTypeStatisticData.map((value) => value.name).toSet().toList())
                            state.studentsEducationTypeStatisticData.where((value) => value.eduType == "Ordinatura").toList().where((value) => value.name == i).toList().map((value) => value.count).toList().reduce((a,b) => a + b)
                        ],
                        dataName: state.studentsEducationTypeStatisticData.map((value) => value.name).toSet().toList(),
                        backgroundColor: Colors.white,
                        showLine: true,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: ShowOtmData(
                        title: AppLocalizations.of(context)!.masters,
                        decorativeColor:
                        AppColors.otmStudentsPageDecorativeColor,
                        iconName: AppSvgs.studentsResidencyIcon,
                        count: state.studentsEducationTypeStatisticData.where((value) => value.eduType == "Magistr").toList().map((value) => value.count).toList().reduce((a,b) => a + b),
                        dataNumber: [
                          for(var i in state.studentsEducationTypeStatisticData.map((value) => value.name).toSet().toList())
                            state.studentsEducationTypeStatisticData.where((value) => value.eduType == "Magistr").toList().where((value) => value.name == i).toList().map((value) => value.count).toList().reduce((a,b) => a + b)
                        ],
                        dataName: [AppLocalizations.of(context)!.male, AppLocalizations.of(context)!.female],
                        backgroundColor: Colors.white,
                        showLine: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 11),
                ShowOtmData(
                  title: AppLocalizations.of(context)!.bachelor,
                  decorativeColor: AppColors.otmStudentsPageDecorativeColor,
                  iconName: AppSvgs.studentsMasterDegreeIcon,
                  count: state.studentsEducationTypeStatisticData.where((value) => value.eduType == "Bakalavr").toList().map((value) => value.count).toList().reduce((a,b) => a + b),
                  dataNumber: [
                    for(var i in state.studentsEducationTypeStatisticData.map((value) => value.name).toSet().toList())
                      state.studentsEducationTypeStatisticData.where((value) => value.eduType == "Bakalavr").toList().where((value) => value.name == i).toList().map((value) => value.count).toList().reduce((a,b) => a + b)
                  ],
                  dataName: [AppLocalizations.of(context)!.male, AppLocalizations.of(context)!.female],
                  backgroundColor: Colors.white,
                  showLine: true,
                ),
              ],
            ),
          );
        }else{
          return CustomOtmContainer(child: Center(child: Text("Ma'lumotlar topilmadi!"),));
        }
      },
    );
  }
}

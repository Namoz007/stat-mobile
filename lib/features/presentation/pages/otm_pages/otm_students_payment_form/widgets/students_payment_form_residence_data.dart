import 'package:stat_edu_mobile/sources.dart';

class StudentsPaymentFormResidenceData extends StatefulWidget {
  const StudentsPaymentFormResidenceData({super.key});

  @override
  State<StudentsPaymentFormResidenceData> createState() =>
      _StudentsPaymentFormResidenceDataState();
}

class _StudentsPaymentFormResidenceDataState
    extends State<StudentsPaymentFormResidenceData> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsPaymentFormBloc>().add(
      GetResidenceDataStudentsPaymentFormEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsPaymentFormBloc, StudentsPaymentFormState>(
      builder: (context, state) {

        if(state.studentsResidence.isNotEmpty){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              state.studentsResidence.map((value) => value.eduType).toSet().toList().length,
                  (index) {
                Map<String,Color> residences = {};
                state.studentsResidence.where((value) => value.eduType == state.studentsResidence.map((value) => value.eduType).toSet().toList()[index]).toList().map((value) => value.name).toSet().toList().asMap().forEach((key,value) => residences[value] = AppColors.allColors[key]);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CustomOtmContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${AppLocalizations.of(context)!.residenceRegion}:${state.studentsResidence.map((value) => value.eduType).toSet().toList()[index]}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.otmStudentsPageDecorativeColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ShowMultiStatisticChart(
                          statisticTitles: residences.keys.toList(),
                          statisticLabelColor: [
                            for(var i in residences.keys.toList())
                              [
                                for(var v in state.studentsResidence)
                                  if(i == v.name && v.eduType == state.studentsResidence.map((value) => value.eduType).toSet().toList()[index])
                                    residences[v.name]!
                              ]
                          ],
                          statisticItemNumber: [
                            for(var i in residences.keys.toList())
                              [
                                for(var v in state.studentsResidence)
                                  if(i == v.name && v.eduType == state.studentsResidence.map((value) => value.eduType).toSet().toList()[index])
                                    v.count
                              ]
                          ],
                          statisticItemNumberBorderColors: [],
                          statisticItemNumberColor: [
                            for(var i in residences.keys.toList())
                              [
                                for(var v in state.studentsResidence)
                                  if(i == v.name && v.eduType == state.studentsResidence.map((value) => value.eduType).toSet().toList()[index])
                                    residences[v.name]!
                              ]
                          ],
                          statisticLineCount: 5,
                          labelHeight: 30,
                          statisticLineColor: Colors.grey.shade300,
                          showBottomStatisticNumber: true,
                          titlePercent: 20,
                          labelCountPercent: 20,
                          labelPercent: 60,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }else{
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomOtmContainer(child: ShowLoadingWidget(title: AppLocalizations.of(context)!.residenceRegion, titleColor: AppColors.otmStudentsPageDecorativeColor,)),
          );
        }
      },
    );
  }
}

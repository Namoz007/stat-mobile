import 'package:stat_edu_mobile/sources.dart';

class StudentsRegionSectionPaymentForm extends StatefulWidget {
  const StudentsRegionSectionPaymentForm({super.key});

  @override
  State<StudentsRegionSectionPaymentForm> createState() =>
      _StudentsRegionSectionPaymentFormState();
}

class _StudentsRegionSectionPaymentFormState
    extends State<StudentsRegionSectionPaymentForm> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsRegionSectionBloc>().add(
      GetPaymentFormStudentsRegionSectionEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsRegionSectionBloc, StudentsRegionSectionState>(
      builder: (context, state) {

        if(state.loading || state.studentsPaymentFormData.isEmpty){
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.paymentForm, titleColor: AppColors.otmStudentsPageDecorativeColor);
        }

        if (state.studentsPaymentFormData.isNotEmpty) {
          Map<String, Color> paymentData = {};
          state.studentsPaymentFormData
              .map((value) => value.name)
              .toSet()
              .toList()
              .asMap()
              .forEach(
                (key, value) => paymentData[value] = AppColors.colors1[key],
              );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.paymentForm,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.otmStudentsPageDecorativeColor,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(paymentData.keys.toList().length, (index){
                  return Column(
                    children: [
                      Text(getTranslateWord(context: context, value: paymentData.keys.toList()[index]),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
                      Text(formatNumber(state.studentsPaymentFormData.where((value) => value.name == paymentData.keys.toList()[index]).toList().map((value) => value.count).toList().reduce((a,b) => a + b)),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: AppColors.otmStudentsPageDecorativeColor,),),
                    ],
                  );
                },),
              ),
              const SizedBox(height: 12,),
              ShowMultiStatisticChart(
                statisticTitles:
                    state.studentsPaymentFormData
                        .map((value) => value.region)
                        .toSet()
                        .toList(),
                statisticLabelColor: [
                  for (var i
                      in state.studentsPaymentFormData
                          .map((value) => value.region)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsPaymentFormData)
                        if (i == z.region) paymentData[z.name]!,
                    ],
                ],
                statisticItemNumber: [
                  for (var i
                      in state.studentsPaymentFormData
                          .map((value) => value.region)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsPaymentFormData)
                        if (i == z.region) z.count,
                    ],
                ],
                statisticItemNumberBorderColors: [],
                statisticItemNumberColor: [
                  for (var i
                      in state.studentsPaymentFormData
                          .map((value) => value.region)
                          .toSet()
                          .toList())
                    [
                      for (var z in state.studentsPaymentFormData)
                        if (i == z.region) paymentData[z.name]!,
                    ],
                ],
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
              ),
              ShowRectangleTitle(
                title: paymentData.keys.map((value) => getTranslateWord(context: context, value: value)).toList(),
                colors: paymentData.values.toList(),
                titleColor: AppColors.otmStudentsPageDecorativeColor,
              ),
              const SizedBox(height: 10,),
            ],
          );
        } else {
          return Center(child: Text("Ma'lumotlar topilmadi!"));
        }
      },
    );
  }
}

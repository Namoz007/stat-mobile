import 'package:stat_edu_mobile/sources.dart';

class StudentsCountEducationFormType extends StatefulWidget {
  const StudentsCountEducationFormType({super.key});

  @override
  State<StudentsCountEducationFormType> createState() =>
      _StudentsCountEducationFormTypeState();
}

class _StudentsCountEducationFormTypeState
    extends State<StudentsCountEducationFormType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsControllerBloc>().add(
      GetStudentsEducationFormStudentsControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OtmCategoryControllerCubit>(),
      child: BlocBuilder<StudentsControllerBloc, StudentsControllerState>(
        builder: (context, state) {
          if (state.studentsEducationForm.isNotEmpty) {
            context.read<OtmCategoryControllerCubit>().newCategories([
              "Jami",
              ...state.studentsEducationForm.map((value) => value.ownership),
            ]);
            context.read<OtmCategoryControllerCubit>().newPages(
              [
                    "Jami",
                    ...state.studentsEducationForm.map(
                      (value) => value.ownership,
                    ),
                  ]
                  .map(
                    (value) =>
                        value == "Jami"
                            ? ShowStatisticChart(
                              statisticTitles: [
                                "Sirtqi",
                                "Qo'shma",
                                "Maxsus sirtqi",
                                "Masofaviy",
                                "Kunduzgi",
                                "Kechki",
                                "Ikkinchi oliy(sirtqi)",
                                "Ikkinchi oliy(kunduzgi)",
                                "Ikkinchi oliy(kechki)",
                              ],
                              statisticLabelColor: AppColors.lightGreenChartColor,
                              statisticItemNumber: [
                                state.studentsEducationForm.map((value) => value.externalCount).toList().reduce((a,b) => a + b),
                                state.studentsEducationForm.map((value) => value.jointCount).toList().reduce((a,b) => a + b),
                                state.studentsEducationForm.map((value) => value.specialExternalCount).toList().reduce((a,b) => a + b),
                                state.studentsEducationForm.map((value) => value.remoteCount).toList().reduce((a,b) => a + b),
                                state.studentsEducationForm.map((value) => value.daytimeCount).toList().reduce((a,b) => a + b),
                                state.studentsEducationForm.map((value) => value.eveningCount).toList().reduce((a,b) => a + b),
                                state.studentsEducationForm.map((value) => value.secondExternalCount).toList().reduce((a,b) => a + b),
                                state.studentsEducationForm.map((value) => value.secondDaytimeCount).toList().reduce((a,b) => a + b),
                                state.studentsEducationForm.map((value) => value.secondEveningCount).toList().reduce((a,b) => a + b),
                              ],
                              statisticItemNumberBorderColors: Colors.grey.shade50,
                              statisticItemNumberColor: AppColors.lightGreenChartColor,
                              statisticLineCount: 5,
                              labelHeight: 30,
                              statisticLineColor: Colors.grey.shade300,
                              showBottomStatisticNumber: false,
                          titlePercent: 25,
                          labelPercent: 55,
                          labelCountPercent: 20,
                            )
                            : ShowStatisticChart(
                          statisticTitles: [
                            "Sirtqi",
                            "Qo'shma",
                            "Maxsus sirtqi",
                            "Masofaviy",
                            "Kunduzgi",
                            "Kechki",
                            "Ikkinchi oliy(sirtqi)",
                            "Ikkinchi oliy(kunduzgi)",
                            "Ikkinchi oliy(kechki)",
                          ],
                          statisticLabelColor: AppColors.lightGreenChartColor,
                          statisticItemNumber: [
                            state.studentsEducationForm.where((v) => v.ownership == value).toList().map((v) => v.externalCount).toList().reduce((a,b) => a + b),
                            state.studentsEducationForm.where((v) => v.ownership == value).toList().map((v) => v.jointCount).toList().reduce((a,b) => a + b),
                            state.studentsEducationForm.where((v) => v.ownership == value).toList().map((v) => v.specialExternalCount).toList().reduce((a,b) => a + b),
                            state.studentsEducationForm.where((v) => v.ownership == value).toList().map((v) => v.remoteCount).toList().reduce((a,b) => a + b),
                            state.studentsEducationForm.where((v) => v.ownership == value).toList().map((v) => v.daytimeCount).toList().reduce((a,b) => a + b),
                            state.studentsEducationForm.where((v) => v.ownership == value).toList().map((v) => v.eveningCount).toList().reduce((a,b) => a + b),
                            state.studentsEducationForm.where((v) => v.ownership == value).toList().map((v) => v.secondExternalCount).toList().reduce((a,b) => a + b),
                            state.studentsEducationForm.where((v) => v.ownership == value).toList().map((v) => v.secondDaytimeCount).toList().reduce((a,b) => a + b),
                            state.studentsEducationForm.where((v) => v.ownership == value).toList().map((v) => v.secondEveningCount).toList().reduce((a,b) => a + b),
                          ],
                          statisticItemNumberBorderColors:
                          Colors.grey.shade50,
                          statisticItemNumberColor:
                          AppColors.lightGreenChartColor,
                          statisticLineCount: 5,
                          labelHeight: 30,
                          statisticLineColor: Colors.grey.shade300,
                          showBottomStatisticNumber: false,
                          titlePercent: 25,
                          labelCountPercent: 20,
                          labelPercent: 55,
                        ),
                  )
                  .toList(),
            );
            return BlocBuilder<
              OtmCategoryControllerCubit,
              OtmCategoryControllerState
            >(
              builder: (context, st) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.numberOfStudentsByEducationForm,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.decorativeColor,
                      ),
                    ),
                    const SizedBox(height: 13),
                    SelectCategoryByKey(title: st.categories[st.index], rightOnTap: (){
                      if(st.index != st.categories.length - 1){
                        context.read<OtmCategoryControllerCubit>().newIndex(index: st.index + 1);
                      }
                    }, leftOnTap: (){
                      if(st.index != 0){
                        context.read<OtmCategoryControllerCubit>().newIndex(index: st.index - 1);
                      }
                    },),
                    const SizedBox(height: 12,),
                    st.pages[st.index],
                  ],
                );
              },
            );
          } else {
            return ShowLoadingWidget(
              title: AppLocalizations.of(context)!.numberOfStudentsByEducationForm,
              titleColor: Colors.black,
            );
          }
        },
      ),
    );
  }
}

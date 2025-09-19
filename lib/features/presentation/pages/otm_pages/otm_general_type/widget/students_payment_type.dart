import 'package:stat_edu_mobile/sources.dart';

class StudentsPaymentType extends StatefulWidget {
  const StudentsPaymentType({super.key});

  @override
  State<StudentsPaymentType> createState() => _StudentsPaymentTypeState();
}

class _StudentsPaymentTypeState extends State<StudentsPaymentType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsControllerBloc>().add(
      GetOTMStudentsPaymentTypeStudentsControllerEvent(
        update: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OtmCategoryControllerCubit>(),
      child: BlocBuilder<StudentsControllerBloc, StudentsControllerState>(
        builder: (context, state) {
          if (state.studentsPaymentForm.isNotEmpty) {
            context.read<OtmCategoryControllerCubit>().newCategories([...state.studentsPaymentForm.map((value) => value.ownership),"Jami"].reversed.toList());
            context.read<OtmCategoryControllerCubit>().newPages(
                [...state.studentsPaymentForm.map((value) => value.ownership),"Jami"].reversed.toList().map((value){

                  if(value == "Jami"){
                    return ShowCircleStatistic(percents: [calculatePercent(state.studentsPaymentForm.map((value) => value.grandCount + value.contractCount).toList().reduce((a,b) => a + b), state.studentsPaymentForm.map((value) => value.grandCount).toList().reduce((a,b) => a + b)),calculatePercent(state.studentsPaymentForm.map((value) => value.grandCount + value.contractCount).toList().reduce((a,b) => a + b), state.studentsPaymentForm.map((value) => value.contractCount).toList().reduce((a,b) => a + b)),], percentTitles: ["",""], percentColors: [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart,], percentRadius: [60,60,],centerTitle: formatNumber(state.studentsPaymentForm.map((v) => v.grandCount + v.contractCount).toList().reduce((a,b) => a + b)),centerTitleStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 25,),);
                  }else{
                    return ShowCircleStatistic(percents: [calculatePercent(state.studentsPaymentForm.where((v) => v.ownership == value).toList().map((v) => v.grandCount + v.contractCount).toList().reduce((a,b) => a + b), state.studentsPaymentForm.where((v) => v.ownership == value).toList().map((v) => v.grandCount).toList().reduce((a,b) => a + b)),calculatePercent(state.studentsPaymentForm.where((v) => v.ownership == value).toList().map((v) => v.grandCount + v.contractCount).toList().reduce((a,b) => a + b), state.studentsPaymentForm.where((v) => v.ownership == value).toList().map((v) => v.contractCount).toList().reduce((a,b) => a + b)),], percentTitles: ["",""], percentColors: [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart,], percentRadius: [60,60],centerTitleStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,),centerTitle: formatNumber(state.studentsPaymentForm.where((v) => v.ownership == value).toList().map((value) => value.contractCount + value.grandCount).toList().reduce((a,b) => a + b)),);

                  }

                },).toList(),
            );
            return BlocBuilder<OtmCategoryControllerCubit,OtmCategoryControllerState>(builder: (context,st){
              return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.numberOfStudentsByPaymentType,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.decorativeColor,
                    ),
                  ),
                  const SizedBox(height: 13),
                  SelectCategoryByKey(
                    title: st.categories[st.index],
                    rightOnTap: () {
                      if(st.index != st.pages.length - 1){
                        context.read<OtmCategoryControllerCubit>().newIndex(index:st.index + 1,updateController: true);
                      }
                    },
                    leftOnTap: () {
                      if(st.index != 0){
                        context.read<OtmCategoryControllerCubit>().newIndex(index:st.index - 1,updateController: true);
                      }
                    },
                  ),
                  const SizedBox(height: 31),
                  Center(
                    child: SizedBox(
                      width: 250,
                      height: 250,
                      child: PageView(
                        controller: st.controller,
                        physics: const NeverScrollableScrollPhysics(),
                        children: st.pages,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ShowRectangleTitle(title: [AppLocalizations.of(context)!.stateGrant,AppLocalizations.of(context)!.contractBased], colors: [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart,], titleColor: Colors.black,),
                  const SizedBox(height: 12,),
                ],
              );
            },);
          } else {
            return ShowCircleLoadingWidget(title: AppLocalizations.of(context)!.numberOfStudentsByPaymentType, titleColor: Colors.black, showSelectCategory: true, containerHeight: 250, containerWidth: 250);
          }
        },
      ),
    );
  }
}

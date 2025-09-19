import 'package:stat_edu_mobile/sources.dart';

class StudentsGenderType extends StatefulWidget {
  const StudentsGenderType({super.key});

  @override
  State<StudentsGenderType> createState() => _StudentsGenderTypeState();
}

class _StudentsGenderTypeState extends State<StudentsGenderType> {
  @override
  void initState() {
    super.initState();
    context.read<StudentsControllerBloc>().add(
      GetStudentsByGenderStudentsControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OtmCategoryControllerCubit>(),
      child: BlocBuilder<StudentsControllerBloc, StudentsControllerState>(
        builder: (context, state) {
          if (state.studentsStatisticGender.isNotEmpty) {
            context.read<OtmCategoryControllerCubit>().newCategories([...state.studentsStatisticGender.map((value) => value.ownership),"Jami"].reversed.toList());
            context.read<OtmCategoryControllerCubit>().newPages([
              for(var i in [...state.studentsStatisticGender.map((value) => value.ownership),AppLocalizations.of(context)!.overall].reversed.toList())
                if(i == AppLocalizations.of(context)!.overall)
                  ShowCircleStatistic(percents: [calculatePercent(state.studentsStatisticGender.map((value) => value.femaleCount + value.maleCount).toList().reduce((a,b) => a + b), state.studentsStatisticGender.map((value) => value.maleCount).toList().reduce((a,b) => a + b)),calculatePercent(state.studentsStatisticGender.map((value) => value.femaleCount + value.maleCount).toList().reduce((a,b) => a + b), state.studentsStatisticGender.map((value) => value.femaleCount).toList().reduce((a,b) => a + b)),], percentTitles: [(calculatePercent(state.studentsStatisticGender.map((value) => value.femaleCount + value.maleCount).toList().reduce((a,b) => a + b), state.studentsStatisticGender.map((value) => value.maleCount).toList().reduce((a,b) => a + b)) * 100).toStringAsFixed(2),(calculatePercent(state.studentsStatisticGender.map((value) => value.femaleCount + value.maleCount).toList().reduce((a,b) => a + b), state.studentsStatisticGender.map((value) => value.femaleCount).toList().reduce((a,b) => a + b)) * 100).toStringAsFixed(2)], percentColors: [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart,], percentRadius: [60,60],centerTitle: formatNumber(state.studentsStatisticGender.map((value) => value.femaleCount + value.maleCount).toList().reduce((a,b) => a + b)),centerTitleStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 25,),)
              else
                  ShowCircleStatistic(percents: [calculatePercent(state.studentsStatisticGender.where((value) => value.ownership == i).toList().map((value) => value.maleCount + value.femaleCount).toList().reduce((a,b) => a + b), state.studentsStatisticGender.where((value) => value.ownership == i).toList().map((value) => value.maleCount).toList().reduce((a,b) => a + b)),calculatePercent(state.studentsStatisticGender.where((value) => value.ownership == i).toList().map((value) => value.maleCount + value.femaleCount).toList().reduce((a,b) => a + b), state.studentsStatisticGender.where((value) => value.ownership == i).toList().map((value) => value.femaleCount).toList().reduce((a,b) => a + b))], percentTitles: [(calculatePercent(state.studentsStatisticGender.where((value) => value.ownership == i).toList().map((value) => value.maleCount + value.femaleCount).toList().reduce((a,b) => a + b), state.studentsStatisticGender.where((value) => value.ownership == i).toList().map((value) => value.maleCount).toList().reduce((a,b) => a + b)) * 100).toStringAsFixed(2),(calculatePercent(state.studentsStatisticGender.where((value) => value.ownership == i).toList().map((value) => value.maleCount + value.femaleCount).toList().reduce((a,b) => a + b), state.studentsStatisticGender.where((value) => value.ownership == i).toList().map((value) => value.femaleCount).toList().reduce((a,b) => a + b)) * 100).toStringAsFixed(2)], percentColors: [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart,], percentRadius: [60,60],centerTitleStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,),centerTitle: formatNumber(state.studentsStatisticGender.where((value) => value.ownership == i).toList().map((value) => value.maleCount + value.femaleCount).toList().reduce((a,b) => a + b)),)

            ]);
            return BlocBuilder<OtmCategoryControllerCubit,OtmCategoryControllerState>(
              builder: (context, st) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.numberOfStudentsByGender,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 14),
                    SelectCategoryByKey(
                      title: st.categories[st.index],
                      rightOnTap: () {
                        if(st.categories.length - 1 != st.index){
                          context.read<OtmCategoryControllerCubit>().newIndex(index:st.index + 1,updateController: true);
                        }
                      },
                      leftOnTap: () {
                        if(st.index != 0){
                          context.read<OtmCategoryControllerCubit>().newIndex(index:st.index - 1,updateController: true);
                        }
                      },
                    ),
                    const SizedBox(height: 12,),
                    Center(
                      child: SizedBox(
                        height: 250,
                        width: 250,
                        child: PageView(
                          controller: st.controller,
                          physics: const NeverScrollableScrollPhysics(),
                          children: st.pages,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    ShowRectangleTitle(title: [AppLocalizations.of(context)!.male,AppLocalizations.of(context)!.female], colors: [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart], titleColor: Colors.black,),
                    const SizedBox(height: 12,),
                  ],
                );
              },
            );
          } else {
            return ShowCircleLoadingWidget(title: AppLocalizations.of(context)!.numberOfStudentsByGender, titleColor: Colors.black, showSelectCategory: true, containerHeight: 250, containerWidth: 250);
          }
        },
      ),
    );
  }
}

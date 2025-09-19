import 'package:stat_edu_mobile/sources.dart';

class ProfessorAndTeacherGenderType extends StatefulWidget {
  const ProfessorAndTeacherGenderType({super.key});

  @override
  State<ProfessorAndTeacherGenderType> createState() =>
      _ProfessorAndTeacherGenderTypeState();
}

class _ProfessorAndTeacherGenderTypeState
    extends State<ProfessorAndTeacherGenderType> {

  @override
  void initState() {
    super.initState();
    context.read<TeachersControllerBloc>().add(
      GetProfessorsGenderDataTeachersControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OtmCategoryControllerCubit>(),
      child: BlocBuilder<TeachersControllerBloc, TeachersControllerState>(
        builder: (context, state) {
          if (state.professerAndTeacherGenderData.isNotEmpty) {

            context.read<OtmCategoryControllerCubit>().newCategories([
              ...state.professerAndTeacherGenderData
                  .map((value) => value.ownership),
              "Jami",
            ].reversed.toList());
            context.read<OtmCategoryControllerCubit>().newPages(
                [
                  ...state.professerAndTeacherGenderData
                      .map((value) => value.ownership),
                  "Jami",
                ].reversed.toList().map((value) => value == "Jami" ? ShowCircleStatistic(percents: [calculatePercent(state.professerAndTeacherGenderData.map((value) => value.maleCount + value.femaleCount).toList().reduce((a,b) => a + b), state.professerAndTeacherGenderData.map((value) => value.maleCount).toList().reduce((a,b) => a + b)),calculatePercent(state.professerAndTeacherGenderData.map((value) => value.maleCount + value.femaleCount).toList().reduce((a,b) => a + b), state.professerAndTeacherGenderData.map((value) => value.femaleCount).toList().reduce((a,b) => a + b)),], percentTitles: ["",""], percentColors: [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart], percentRadius: [60,60],centerTitle: formatNumber(state.professerAndTeacherGenderData.map((v) => v.femaleCount + v.maleCount).toList().reduce((a,b) => a + b),),centerTitleStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),) : ShowCircleStatistic(percents: [calculatePercent(state.professerAndTeacherGenderData.where((v) => v.ownership == value).toList().map((v) => v.femaleCount + v.maleCount).toList().reduce((a,b) => a + b),state.professerAndTeacherGenderData.where((v) => v.ownership == value).toList().map((v) => v.maleCount).toList().reduce((a,b) => a + b),),calculatePercent(state.professerAndTeacherGenderData.where((v) => v.ownership == value).toList().map((v) => v.femaleCount + v.maleCount).toList().reduce((a,b) => a + b),state.professerAndTeacherGenderData.where((v) => v.ownership == value).toList().map((v) => v.maleCount).toList().reduce((a,b) => a + b),),], percentTitles: ["",""], percentColors: [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart], percentRadius: [60,60],centerTitle: formatNumber(state.professerAndTeacherGenderData.where((v) => v.ownership == value).toList().map((v) => v.femaleCount + v.maleCount).toList().reduce((a,b) => a + b)),centerTitleStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,),)).toList()
            );
            return BlocBuilder<
              OtmCategoryControllerCubit,
              OtmCategoryControllerState
            >(
              builder: (context, v) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(
                          AppLocalizations.of(context)!.professorsByGender,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.decorativeColor,
                          ),
                        ),),
                        MultiStatisticTitle(title: [AppLocalizations.of(context)!.male,AppLocalizations.of(context)!.female], titleColors: [AppColors.circleStatisticBlueChart,AppColors.circleStatisticPinkChart,],),
                      ],
                    ),
                    const SizedBox(height: 13),
                    SelectCategoryByKey(
                      title: v.categories[v.index],
                      rightOnTap: () {
                        if(v.index != v.categories.length - 1){
                          context.read<OtmCategoryControllerCubit>().newIndex(index:v.controller.page!.round() + 1,updateController: true);
                        }
                      },
                      leftOnTap: () {
                        if(v.index != 0){
                          context.read<OtmCategoryControllerCubit>().newIndex(index:v.controller.page!.round() - 1,updateController: true);
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: SizedBox(
                        height: 250,
                        width: 250,
                        child: PageView(
                          controller: v.controller,
                          physics: const NeverScrollableScrollPhysics(),
                          children: v.pages,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            );
          } else {
            return ShowCircleLoadingWidget(title: AppLocalizations.of(context)!.professorsByGender, titleColor: Colors.black, showSelectCategory: true, containerHeight: 250, containerWidth: 250);
          }
        },
      ),
    );
  }
}

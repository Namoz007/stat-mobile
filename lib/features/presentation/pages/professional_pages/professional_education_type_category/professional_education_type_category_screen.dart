import 'package:stat_edu_mobile/sources.dart';

class ProfessionalEducationTypeCategoryScreen extends StatelessWidget {
  const ProfessionalEducationTypeCategoryScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalTabbarControllerCubit,
        ProfessionalTabBarControllerState>(
      builder: (context, state) {
        List<Widget> categories = [
          ProfessionalStudentsScreen(),
          ProfessionalInstitutionScreen(),

        ];
        return RefreshIndicator(
          child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            padding: const EdgeInsets.all(0),
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  color: AppColors.screenAppBarCategoryColor,
                ),
                child: ProfessionalCategoryTab(),
              ),
              categories[state.index],
            ],
          ),
          onRefresh: () async {
            if(state.index == 0){
              context.read<ProfessionalEducationBloc>().add(GetStudentsDataProfessionalEducationEvent(update: true));
            }else{
              context.read<ProfessionalInstitutionControllerCubit>().getInstitutions(true);
            }
          },
        );
      },
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class ProfessionalCategoryTab extends StatefulWidget {
  const ProfessionalCategoryTab({super.key});

  @override
  State<ProfessionalCategoryTab> createState() =>
      _ProfessionalCategoryTabState();
}

class _ProfessionalCategoryTabState extends State<ProfessionalCategoryTab> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      ProfessionalTabbarControllerCubit,
      ProfessionalTabBarControllerState
    >(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: CategoryTabbarItem(
                  hintText: AppLocalizations.of(context)!.studentsInVocational,
                  isCurrent: state.index == 0,
                  index: 0,
                  onTap: () => context.read<ProfessionalInstitutionControllerCubit>().searchInstitutionsWithName(null),
                ),
              ),
              Expanded(
                child: CategoryTabbarItem(
                  hintText: AppLocalizations.of(context)!.institutionsList,
                  isCurrent: state.index == 1,
                  index: 1,
                  onTap: (){},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

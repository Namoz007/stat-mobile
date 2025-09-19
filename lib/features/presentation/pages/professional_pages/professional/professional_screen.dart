import 'package:stat_edu_mobile/sources.dart';

class ProfessionalScreen extends StatefulWidget {
  const ProfessionalScreen({super.key});

  @override
  State<ProfessionalScreen> createState() => _ProfessionalScreenState();
}

class _ProfessionalScreenState extends State<ProfessionalScreen> {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<StudentsFilterCubit>(),),
        BlocProvider(create: (context) => getIt<ProfessionalTabbarControllerCubit>()),
      ],
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<StudentsFilterCubit,StudentsFilterState>(
                builder: (context, state) {
                  return UniversalAppbar(
                    iconOnTap: () {
                      context.read<StudentsFilterCubit>().showCategory();
                    },
                    appBarTitle: AppLocalizations.of(context)!.vocationalEducation,
                    appBarHeight: 120,
                    stackWidget: BlocBuilder<
                        ProfessionalTabbarControllerCubit,
                        ProfessionalTabBarControllerState
                    >(
                      builder: (context, state) {
                        return const Align(
                          alignment: Alignment.bottomRight,
                          child: CategoryFilter(),
                        );
                      },
                    ),
                    showAppBarCategoryContainer: true,
                  );
                },
              ),
              
              Expanded(
                flex: 1,
                child: BlocBuilder<StudentsFilterCubit, StudentsFilterState>(
                  builder: (context, state) {
                    if (state.showCategory) {
                      return Padding(padding: const EdgeInsets.only(top: 20),child: ShowOtmStudentsTypeFilterCategory(),);
                    }

                    switch (state.category) {
                      case StudentsFilterCategory.education_type:
                        return ProfessionalEducationTypeCategoryScreen();

                      case StudentsFilterCategory.education_form:
                        return ProfessionalEducationFormScreen();

                      case StudentsFilterCategory.payment_form:
                        return ProfessionalPaymentFormCategoryScreen();

                      case StudentsFilterCategory.courses:
                        return ProfessionalCoursesCategoryScreen();

                      case StudentsFilterCategory.citizenship:
                        return ProfessionalCitizenshipCategoryScreen();

                      case StudentsFilterCategory.age:
                        return ProfessionalAgeCategoryScreen();

                      case StudentsFilterCategory.areas:
                        return ProfessionalResidenceAreaCategoryScreen();

                      case StudentsFilterCategory.areas_section:
                        return ProfessionalAreasSectionCategoryScreen();

                      default:
                        return SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

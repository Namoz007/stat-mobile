import 'package:stat_edu_mobile/sources.dart';

class AcceptanceScreen extends StatelessWidget {
  const AcceptanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<AcceptanceFilterCategoryCubit>(),
        child: Container(
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
              UniversalAppbar(
                iconOnTap: () {
                  context.read<DoctoralStudiesFilterCubit>().showCategory();
                },
                appBarTitle: AppLocalizations.of(context)!.admission,
                appBarHeight: 120,
                showAppBarCategoryContainer: false,
              ),
              Flexible(
                child: BlocBuilder<
                  AcceptanceFilterCategoryCubit,
                  AcceptanceFilterCategoryState
                >(
                  builder: (context, state) {

                    switch(state.currentCategory){

                      case AcceptanceFilterCategory.Acceptancefrom2021to2024:
                        return AcceptanceOldAcceptanceDataScreen();

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

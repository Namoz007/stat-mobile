import 'package:stat_edu_mobile/sources.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backgroundImage),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.decorativeColor,),
              child: HomeScreenAppbar(scaffoldKey: _scaffoldKey),
            ),
            Expanded(
              child: RefreshIndicator(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  physics: const ScrollPhysics(),
                  children: [
                    OtmAllCount(),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(
                            AppLocalizations.of(context)!.professionalEducation,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: AppColors.decorativeColor,
                            ),
                          ),),
                          GestureDetector(
                            onTap: () {
                              context.read<BaseControllerCubit>().updateScreen(2);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.all,
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.textButtonColors,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ProfessionalSchools(),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.admission,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: AppColors.decorativeColor,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              context.read<BaseControllerCubit>().updateScreen(3);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.all,
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.textButtonColors,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 19),
                    AcceptanceStatistic(),
                    const SizedBox(height: 20),
                  ],
                ),
                onRefresh: () async {
                  context.read<OtmControllerBloc>().add(GetUniversitiesOtmControllerEvent(update: true));
                  context.read<OtmControllerBloc>().add(GetProfessorsGenderOtmControllerEvent(update: true));
                  context.read<OtmControllerBloc>().add(GetStudentsCountDataOtmControllerEvent(update: true));
                  context.read<ProfessionalEducationBloc>().add(GetStudentsDataProfessionalEducationEvent(update: true));

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

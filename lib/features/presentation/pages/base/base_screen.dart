import 'package:stat_edu_mobile/sources.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  List<Widget> screens = [HomeScreen(), OtmScreen(), ProfessionalScreen(),AcceptanceScreen(),DoctoralStudiesScreen()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UrlLaunchCubit,UrlLaunchState>(
        listener: (context, life) {
          if(life.error != null){
            showDialog(context: context, builder: (context) => ShowErrorDialog(error: life.error!));
          }
        },
        child: BlocBuilder<BaseControllerCubit, BaseControllerState>(
          builder: (context, state) {
            return IndexedStack(
              index: state.screenIndex,
              children: screens,);
          },
        ),
      ),
      bottomNavigationBar:
          BlocBuilder<BaseControllerCubit, BaseControllerState>(
            builder: (context, state) {
              return BottomNavigationBar(
                elevation: 0,
                currentIndex: state.screenIndex,
                onTap: (index) {
                  context.read<BaseControllerCubit>().updateScreen(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      state.screenIndex == 0
                          ? AppSvgs.selectMainIcon
                          : AppSvgs.unselectMainIcon,
                    ),
                    label: AppLocalizations.of(context)!.main,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      state.screenIndex == 1
                          ? AppSvgs.selectOTMIcon
                          : AppSvgs.unselectOTMIcon,
                    ),
                    label: AppLocalizations.of(context)!.higherEducation,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      state.screenIndex == 2
                          ? AppSvgs.selectJobIcon
                          : AppSvgs.unselectJobIcon,
                    ),
                    label: AppLocalizations.of(context)!.professionalEducation,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      state.screenIndex == 3
                          ? AppSvgs.selectAcceptanceIcon
                          : AppSvgs.unselectAcceptanceIcon,
                    ),
                    label: AppLocalizations.of(context)!.admission,
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      state.screenIndex == 4
                          ? AppSvgs.selectDoctorateIcon
                          : AppSvgs.unselectDoctorateIcon,
                    ),
                    label: AppLocalizations.of(context)!.doctoral_studies,
                  ),
                ],
                showSelectedLabels: true,
                selectedItemColor: AppColors.bottomNavigationIconColor,
                unselectedItemColor: Colors.black,
                unselectedLabelStyle: TextStyle(color: Colors.black),
                useLegacyColorScheme: true,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
              );
            },
          ),
    );
  }
}

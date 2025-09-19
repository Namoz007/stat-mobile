import 'package:stat_edu_mobile/sources.dart';

class OtmScreen extends StatefulWidget {
  const OtmScreen({super.key});

  @override
  State<OtmScreen> createState() => _OtmScreenState();
}

class _OtmScreenState extends State<OtmScreen> {
  late final List<Widget> _categoryScreen;
  final PageController _pageController = PageController(initialPage: 0);
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _categoryScreen = [
      GeneralPage(),
      OtmStudentsTypePage(),
      OtmTeachersTypePage(),
      OtmListPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<StudentsFilterCubit>(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocBuilder<
              OtmTitleCategoryControllerCubit,
              OtmTitleCategoryControllerState>(
            builder: (context, state) {
              return Column(
                children: [
                  UniversalAppbar(
                    appBarTitle: AppLocalizations.of(context)!.higherEducation,
                    appBarHeight: 120,
                    showAppBarCategoryContainer: state.index == 1,
                    iconOnTap: () {
                      if (state.index == 1) {
                        context.read<StudentsFilterCubit>().showCategory();
                      }
                    },
                  ),
                  OtmTitleMenu(
                    pageController: _pageController,
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                      child: PageView(
                        controller: state.controller,
                        physics: const NeverScrollableScrollPhysics(),
                        children: _categoryScreen,
                      )
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

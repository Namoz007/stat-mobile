import '../../../../../sources.dart';

class HomeScreenAppbar extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey;

  HomeScreenAppbar({super.key, required this.scaffoldKey});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 55),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppSvgs.logo),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 8, right: 8),
          child: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: SvgPicture.asset(AppSvgs.drawerIcon),
          ),
        ),
      ],
    );
  }
}

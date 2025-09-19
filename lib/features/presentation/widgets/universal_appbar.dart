import 'package:stat_edu_mobile/sources.dart';

class UniversalAppbar extends StatefulWidget {
  String appBarTitle;
  double appBarHeight;
  Widget? stackWidget;
  bool showAppBarCategoryContainer;
  VoidCallback iconOnTap;
  TextEditingController? textController;

  UniversalAppbar({
    super.key,
    required this.appBarTitle,
    required this.appBarHeight,
    this.stackWidget,
    required this.showAppBarCategoryContainer,
    required this.iconOnTap,
    this.textController,
  });

  @override
  State<UniversalAppbar> createState() => _UniversalAppbarState();
}

class _UniversalAppbarState extends State<UniversalAppbar> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: widget.appBarHeight,
      padding: const EdgeInsets.only(left: 0, top: 30),
      decoration: BoxDecoration(color: AppColors.decorativeColor),
      alignment: Alignment.topLeft,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 19),
              child: Text(
                widget.appBarTitle,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
                color: AppColors.screenAppBarCategoryColor,
              ),
            ),
          ),

          if (widget.showAppBarCategoryContainer)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 16,right: 20,),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 18,
                    ),
                    InkWell(
                      onTap: widget.iconOnTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.filterBorderColor,
                            )
                        ),
                        child: SvgPicture.asset(AppSvgs.filterIcon,),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

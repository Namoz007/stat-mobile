import 'package:stat_edu_mobile/sources.dart';

class ShowOtmType extends StatelessWidget {
  List<Color> gradientColors;
  String title;
  int count;
  String iconName;
  double iconWidth;
  double iconHeight;

  ShowOtmType({
    super.key,
    required this.gradientColors,
    required this.title,
    required this.count,
    required this.iconName,
    required this.iconWidth,
    required this.iconHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 11, bottom: 16, left: 12),
      width: 231,
      height: 132,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(AppImages.otmBackgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "sfbold",
                    fontSize: 12.75,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      count.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: iconWidth,
                      height: iconHeight,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(iconName),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox()
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

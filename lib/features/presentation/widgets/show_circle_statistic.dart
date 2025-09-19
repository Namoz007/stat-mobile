import 'package:stat_edu_mobile/sources.dart';

class ShowCircleStatistic extends StatelessWidget {
  List<double> percents;
  List<String> percentTitles;
  List<Color> percentColors;
  List<double> percentRadius;
  String? centerTitle;
  TextStyle? centerTitleStyle;
  double? offsetPosition;
  bool? showPercentIcon;

  ShowCircleStatistic({
    super.key,
    required this.percents,
    required this.percentTitles,
    required this.percentColors,
    required this.percentRadius,
    this.centerTitle,
    this.centerTitleStyle,
    this.offsetPosition,
    this.showPercentIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PieChart(
          PieChartData(
            startDegreeOffset: offsetPosition ?? 270,
            sections: List.generate(percents.length, (index) {
              return PieChartSectionData(
                title: "${percentTitles[index]} ${showPercentIcon != null && showPercentIcon! ? "%" : ''}",
                value: percents[index],
                color: percentColors[index],
                radius: percentRadius[index],
                titleStyle: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w700,)
              );
            }),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(centerTitle ??'', style: centerTitleStyle),
        ),
      ],
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class ShowAcceptanceStatistics extends StatelessWidget {
  String statisticTitle;
  int statisticCount;
  Color statisticPercentColor;
  Color statisticFullColor;
  double statisticPercent;
  Color percentTextColor;

  ShowAcceptanceStatistics({
    super.key,
    required this.statisticTitle,
    required this.statisticCount,
    required this.statisticPercentColor,
    required this.statisticFullColor,
    required this.statisticPercent,
    required this.percentTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: statisticFullColor,
      ),
      child: Stack(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width - 24) * (statisticPercent / 100),
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: statisticPercentColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  statisticTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.acceptanceStatisticNameColor,
                  ),
                ),
                Text(
                  statisticCount.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                    color: percentTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

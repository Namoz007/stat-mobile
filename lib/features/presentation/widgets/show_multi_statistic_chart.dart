import 'package:stat_edu_mobile/sources.dart';

class ShowMultiStatisticChart extends StatelessWidget {
  List<String> statisticTitles;
  List<List<Color>> statisticLabelColor;
  List<List<int>> statisticItemNumber;
  List<List<Color>> statisticItemNumberBorderColors;
  List<List<Color>> statisticItemNumberColor;
  int statisticLineCount;
  double labelHeight;
  Color statisticLineColor;
  bool showBottomStatisticNumber;
  int? titlePercent;
  int? labelPercent;
  int? labelCountPercent;

  ShowMultiStatisticChart({
    super.key,
    required this.statisticTitles,
    required this.statisticLabelColor,
    required this.statisticItemNumber,
    required this.statisticItemNumberBorderColors,
    required this.statisticItemNumberColor,
    required this.statisticLineCount,
    required this.labelHeight,
    required this.statisticLineColor,
    required this.showBottomStatisticNumber,
    this.titlePercent,
    this.labelPercent,
    this.labelCountPercent,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ((statisticItemNumber.expand((a) => a).toList().length ) * labelHeight) + ((statisticItemNumber.expand((a) => a).toList().length - 1) * 10) + 50,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child:
                showBottomStatisticNumber
                    ? Container(
                      margin: EdgeInsets.only(
                        left: getScreenPercentWidth(
                          context,
                          titlePercent ?? 25,
                          55,
                        ),
                        right: getScreenPercentWidth(
                          context,
                          labelCountPercent ?? 15,
                          55,
                        ),
                        bottom: 30,
                      ),
                      width: double.infinity,
                      height: 2,
                      color: statisticLineColor,
                    )
                    : const SizedBox(),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child:
                showBottomStatisticNumber
                    ? Container(
                      margin: EdgeInsets.only(
                        left: getScreenPercentWidth(
                          context,
                          titlePercent ?? 24,
                          55,
                        ),
                        right: getScreenPercentWidth(
                          context,
                          labelCountPercent ?? 14,
                          55,
                        ),
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(statisticLineCount, (index) {
                          return Text(
                            formatNumberInString(
                              generateSteps(
                                statisticItemNumber.expand((a) => a).toList(),
                                statisticLineCount,
                              )[index],
                            ),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 14),
                          );
                        }),
                      ),
                    )
                    : const SizedBox(),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: getScreenPercentWidth(context, labelPercent ?? 60, 55),
              margin: EdgeInsets.only(
                left: getScreenPercentWidth(context, titlePercent ?? 25, 55),
                right: getScreenPercentWidth(
                  context,
                  labelCountPercent ?? 15,
                  55,
                ),
              ),
              height: ((statisticItemNumber.expand((a) => a).toList().length ) * labelHeight) + ((statisticItemNumber.expand((a) => a).toList().length - 1) * 10)  + 20,
                  // showBottomStatisticNumber
                  //     ? ((statisticItemNumber.expand((a) => a).toList().length + 1) * labelHeight ) + (statisticTitles.length * 10) + 15
                  //     : (statisticItemNumber.expand((a) => a).toList().length *
                  //             labelHeight) +
                  //         (statisticTitles.length * 10) +
                  //         10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < statisticLineCount; i++)
                    DottedLine(
                      direction: Axis.vertical,
                      lineLength: double.infinity,
                      dashLength: 4.0,
                      dashGapLength: 4.0,
                      lineThickness: 2.0,
                      dashColor: statisticLineColor,
                    ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: getScreenPercentWidth(
                          context,
                          titlePercent ?? 25,
                          56,
                        ),
                        child: Text(
                          getTranslateWord(context: context, value: statisticTitles[index],),
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.decorativeColor,
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.82,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            statisticItemNumber[index].length,
                            (v) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                width: getScreenPercentWidth(context, labelPercent ?? 60, 56,) * calculatePercent(statisticItemNumber.expand((a) => a).toList().reduce((a, b) => a > b ? a : b),
                                      statisticItemNumber[index][v],
                                    ),
                                height: labelHeight,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: statisticLabelColor[index][v],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Spacer(),

                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          statisticItemNumber[index].length,
                          (i) {
                            // return Text(statisticItemNumber[index][i].toString());
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              width: getScreenPercentWidth(
                                context,
                                labelCountPercent ?? 15,
                                56,
                              ),
                              alignment: Alignment.topRight,
                              padding: const EdgeInsets.only(right: 2),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color:
                                      Colors.grey.shade50,
                                ),
                                child: Stack(
                                  children: [
                                    Text(
                                      statisticItemNumber[index][i].toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            statisticItemNumberColor[index][i],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: statisticTitles.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}

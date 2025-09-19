import 'package:flutter/cupertino.dart';
import 'package:stat_edu_mobile/core/core.dart';

class StatisticTitleCount extends StatelessWidget {
  List<String> title;
  List<int> count;
  Color titleColor;
  Color countColor;
  double titleSize;
  double countSize;
  MainAxisAlignment alignment;
  bool isWrap;

  StatisticTitleCount({
    super.key,
    required this.title,
    required this.count,
    required this.titleColor,
    required this.countColor,
    required this.titleSize,
    required this.countSize,
    required this.alignment,
    required this.isWrap,
  });

  @override
  Widget build(BuildContext context) {
    if(isWrap){
      return Wrap(
        children: List.generate(title.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Text(
                  getTranslateWord(context: context, value: title[index]),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: titleSize,
                    color: titleColor,
                  ),
                ),
                Text(
                  formatNumber(count[index]),
                  style: TextStyle(
                    fontSize: countSize,
                    fontWeight: FontWeight.w700,
                    color: countColor,
                  ),
                ),
              ],
            ),
          );
        }),
      );
    }else{
      return Row(
        mainAxisAlignment: alignment,
        children: List.generate(title.length, (index) {
          return Column(
            children: [
              Text(
                title[index],
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: titleSize,
                  color: titleColor,
                ),
              ),
              Text(
                formatNumber(count[index]),
                style: TextStyle(
                  fontSize: countSize,
                  fontWeight: FontWeight.w700,
                  color: countColor,
                ),
              ),
            ],
          );
        }),
      );
    }
  }
}

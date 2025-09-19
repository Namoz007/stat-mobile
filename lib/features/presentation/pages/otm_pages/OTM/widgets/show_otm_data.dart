import 'package:stat_edu_mobile/sources.dart';

class ShowOtmData extends StatelessWidget {
  String title;
  Color decorativeColor;
  String iconName;
  int count;
  List<int> dataNumber;
  List<String> dataName;
  Color backgroundColor;
  bool? showLine;

  ShowOtmData({
    super.key,
    required this.title,
    required this.decorativeColor,
    required this.iconName,
    required this.count,
    required this.dataNumber,
    required this.dataName,
    required this.backgroundColor,
    this.showLine,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: decorativeColor,
                  ),
                  overflow: TextOverflow.visible,
                  softWrap: true,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(7),
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: dataColor,
                ),
                child: SvgPicture.asset(iconName),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              formatNumber(count),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
                color: decorativeColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          if (showLine != null && showLine!)
            Container(
              width: double.infinity,
              height: 1,
              color: decorativeColor,
            ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < dataNumber.length; i++)
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        formatNumber(dataNumber[i]),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: decorativeColor,
                        ),
                      ),
                      Text(
                        // dataName[i],
                        getTranslateWord(context: context, value: dataName[i]),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: decorativeColor,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

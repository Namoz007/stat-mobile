import 'package:stat_edu_mobile/sources.dart';

class CircleChartBottomDoubleTitle extends StatelessWidget {
  List<String> title;
  List<String> percents;
  List<Color> titleColors;

  CircleChartBottomDoubleTitle({
    super.key,
    required this.title,
    required this.percents,
    required this.titleColors,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(title.length, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 6,
                  width: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: titleColors[index],
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: Text(
                    title[index],
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
                const SizedBox(width: 0),
                Text(
                  percents[index],
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

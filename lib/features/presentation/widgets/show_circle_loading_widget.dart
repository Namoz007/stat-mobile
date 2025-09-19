import 'package:stat_edu_mobile/sources.dart';

class ShowCircleLoadingWidget extends StatelessWidget {
  String title;
  Color titleColor;
  bool showSelectCategory;
  double containerHeight;
  double containerWidth;

  ShowCircleLoadingWidget({
    super.key,
    required this.title,
    required this.titleColor,
    required this.showSelectCategory,
    required this.containerHeight,
    required this.containerWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.numberOfStudentsByGender,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.white,
              child: Container(
                width: 33,
                height: 43,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                ),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.white,
              child: Container(
                width: 123,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black,
                ),
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.white,
              child: Container(
                width: 33,
                height: 43,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        if (showSelectCategory) const SizedBox(height: 12),
        Center(
          child: SizedBox(
            height: containerHeight,
            width: containerWidth,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.white,
              child: ShowCircleStatistic(
                percents: [50, 50],
                percentTitles: ['', ''],
                percentColors: [Colors.black, Colors.black],
                percentRadius: [60, 60],
                centerTitle: "_______",
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.white,
          child: ShowRectangleTitle(
            title: ['_________', "_________"],
            colors: [Colors.black, Colors.black],
            titleColor: titleColor,
          ),
        ),
        const SizedBox(height: 12,),
      ],
    );
  }
}

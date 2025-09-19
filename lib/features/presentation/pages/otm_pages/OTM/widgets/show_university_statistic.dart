import 'package:stat_edu_mobile/sources.dart';

class ShowUniversityStatistic extends StatelessWidget {
  TopUniversityEntity model;
  double containerPercent;
  Color containerColor;

  ShowUniversityStatistic({
    super.key,
    required this.model,
    required this.containerPercent,
    required this.containerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40,
          width: 350 * (containerPercent / 100),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    model.universityName,
                    style: TextStyle(color: Color(0xFF504A32),fontSize: 16),
                  ),
                ),
                Text(
                  formatNumber(model.studentsCount),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.acceptanceStatisticNameColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

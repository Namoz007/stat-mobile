import 'package:stat_edu_mobile/sources.dart';

class TopUniversities extends StatelessWidget {
  List<TopUniversityEntity> universities;

  TopUniversities({super.key, required this.universities});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Talabalar soni bo'yicha TOP 5\nuniversitet",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColors.acceptanceStatisticNameColor,
          ),
        ),

        const SizedBox(height: 9),

        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF919191), width: 0.5),
          ),
        ),
        const SizedBox(height: 15),
        if(universities.isNotEmpty) for (int i = 0;i < universities.length;i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ShowUniversityStatistic(
              model: universities[i],
              containerPercent: 80 - (i * 10),
              containerColor: AppColors.topUniversitiesColors[i],
            ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }
}

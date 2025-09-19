import 'package:stat_edu_mobile/sources.dart';

class AcceptanceStatistic extends StatelessWidget {
  const AcceptanceStatistic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 22, left: 12, right: 23, bottom: 39),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.admissionStatistics,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.decorativeColor,
            ),
          ),
          const SizedBox(height: 20),
          BlocBuilder<AcceptanceControllerCubit, AcceptanceControllerState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShowAcceptanceStatistics(
                    statisticTitle: AppLocalizations.of(context)!.bachelor,
                    statisticCount: 894279,
                    statisticPercentColor: Color(0xFF71BEEF),
                    statisticFullColor: Color(0xFF9FD3FB),
                    statisticPercent: 30,
                    percentTextColor: Color(0xFF71BEEF),
                  ),
                  const SizedBox(height: 12),
                  ShowAcceptanceStatistics(
                    statisticTitle: AppLocalizations.of(context)!.masters,
                    statisticCount: 33172,
                    statisticPercentColor: Color(0xFFC7D858),
                    statisticFullColor: Color(0xFFF3F8D1),
                    statisticPercent: 30,
                    percentTextColor: Color(0xFFC7D858),
                  ),
                  const SizedBox(height: 12),
                  ShowAcceptanceStatistics(
                    statisticTitle: AppLocalizations.of(context)!.academicLyceum,
                    statisticCount: 44356,
                    statisticPercentColor: Color(0xFFFFC7A2),
                    statisticFullColor: Color(0xFFFFEEDD),
                    statisticPercent: 70,
                    percentTextColor: Color(0xFF80684F),
                  ),
                  const SizedBox(height: 12),
                  ShowAcceptanceStatistics(
                    statisticTitle: AppLocalizations.of(context)!.secondSpecialty,
                    statisticCount: 37587,
                    statisticPercentColor: Color(0xFFe1c9d5),
                    statisticFullColor: Color(0xFFFDEBF0),
                    statisticPercent: 56,
                    percentTextColor: Color(0xFFB67587),
                  ),
                  const SizedBox(height: 12),
                  ShowAcceptanceStatistics(
                    statisticTitle: AppLocalizations.of(context)!.transferStudy,
                    statisticCount: 41868,
                    statisticPercentColor: Color(0xFFF1F3FD),
                    statisticFullColor: Color(0xFFDBECFF),
                    statisticPercent: 45,
                    percentTextColor: Color(0xFF82879E),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class StudentsEducationOtmFormArea extends StatefulWidget {
  const StudentsEducationOtmFormArea({super.key});

  @override
  State<StudentsEducationOtmFormArea> createState() =>
      _StudentsEducationOtmFormAreaState();
}

class _StudentsEducationOtmFormAreaState
    extends State<StudentsEducationOtmFormArea> {
  @override
  void initState() {
    super.initState();
    context.read<OtmControllerBloc>().add(
      GetCountryOTMWithAddressOtmControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtmControllerBloc, OtmControllerState>(
      builder: (context, state) {
        if (state.otmDataWithAddress.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.studentsByUniversityLocation,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.decorativeColor,
                ),
              ),
              const SizedBox(height: 13),
              ShowStatisticChart(
                statisticTitles: state.otmDataWithAddress.map((value) => value.region).toList(),
                statisticLabelColor: AppColors.lightGreenChartColor,
                statisticItemNumber: state.otmDataWithAddress.map((value) => value.count).toList(),
                statisticItemNumberBorderColors: Colors.grey.shade50,
                statisticItemNumberColor: AppColors.lightGreenChartColor,
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: false,
                titlePercent: 25,
                labelCountPercent: 20,
                labelPercent: 55,
              ),

            ],
          );
        } else {
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.studentsByUniversityLocation, titleColor: Colors.black);
        }
      },
    );
  }
}

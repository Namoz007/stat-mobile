import 'package:stat_edu_mobile/sources.dart';

class ShowOtmOrganizationalType extends StatefulWidget {
  const ShowOtmOrganizationalType({super.key});

  @override
  State<ShowOtmOrganizationalType> createState() =>
      _ShowOtmOrganizationalTypeState();
}

class _ShowOtmOrganizationalTypeState extends State<ShowOtmOrganizationalType> {
  @override
  void initState() {
    super.initState();
    context.read<OtmControllerBloc>().add(
      GetOtmOrganizationalTypeOtmControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtmControllerBloc, OtmControllerState>(
      builder: (context, state) {
        if(state.otmOrganizationalTypeData.isNotEmpty){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.numberOfUniversitiesByType,
                softWrap: true,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 34),
              ShowStatisticChart(
                statisticTitles: state.otmOrganizationalTypeData.map((value) => value.name).toList(),
                statisticLabelColor: AppColors.circleStatisticBlueChart,
                statisticItemNumber: state.otmOrganizationalTypeData.map((value) => value.count).toList(),
                statisticItemNumberBorderColors: Colors.grey.shade50,
                statisticItemNumberColor: AppColors.circleStatisticBlueChart,
                statisticLineCount: 5,
                labelHeight: 30,
                statisticLineColor: Colors.grey.shade300,
                showBottomStatisticNumber: true,
              ),
            ],
          );
        }else{
          return ShowLoadingWidget(title: AppLocalizations.of(context)!.numberOfUniversitiesByType, titleColor: Colors.black);
        }
      },
    );
  }
}

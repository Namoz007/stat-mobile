import 'package:stat_edu_mobile/sources.dart';

class OtmTeachersTypePage extends StatefulWidget {
  const OtmTeachersTypePage({super.key});

  @override
  State<OtmTeachersTypePage> createState() => _OtmTeachersTypePageState();
}

class _OtmTeachersTypePageState extends State<OtmTeachersTypePage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        CustomOtmContainer(child: TeachersLeaderTypeStatistic()),
        const SizedBox(height: 20),
        CustomOtmContainer(child: TeachersGenderType()),
        const SizedBox(height: 20),
        CustomOtmContainer(child: TeachersEducationType()),
        const SizedBox(height: 20),
        CustomOtmContainer(child: TeachersEducationDegreeType()),
        const SizedBox(height: 20),
        CustomOtmContainer(child: TeachersEducationPositionType()),
        const SizedBox(height: 20),
        CustomOtmContainer(child: TeachersPositionStatisticType()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: LaborFormStatisticType()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: CitizenLaborFormStatisticType()),
        const SizedBox(height: 20,),
        CustomOtmContainer(child: TeachersAgeType()),
      ],
    ), onRefresh: () async => context.read<TeachersControllerBloc>().add(UpdateStateTeachersControllerEvent()));
  }
}

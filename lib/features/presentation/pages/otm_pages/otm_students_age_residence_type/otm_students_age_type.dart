import 'package:stat_edu_mobile/sources.dart';

class OtmStudentsAgeType extends StatefulWidget {
  const OtmStudentsAgeType({super.key});

  @override
  State<OtmStudentsAgeType> createState() => _OtmStudentsAgeTypeState();
}

class _OtmStudentsAgeTypeState extends State<OtmStudentsAgeType> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: ListView(
      padding: const EdgeInsets.all(0),
      children: [
        CustomOtmContainer(child: StudentsAgeGenderData()),
        const SizedBox(height: 20,),
        StudentsAgeResidenceData(),
      ],
    ), onRefresh: () async{
      context.read<StudentsAgeResidenceBloc>().add(UpdateStateStudentsAgeResidenceEvent());
    },);
  }
}

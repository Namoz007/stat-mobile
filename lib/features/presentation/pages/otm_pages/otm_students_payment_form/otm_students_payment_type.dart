import 'package:stat_edu_mobile/sources.dart';

class OtmStudentsPaymentType extends StatefulWidget {
  const OtmStudentsPaymentType({super.key});

  @override
  State<OtmStudentsPaymentType> createState() => _OtmStudentsPaymentTypeState();
}

class _OtmStudentsPaymentTypeState extends State<OtmStudentsPaymentType> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          CustomOtmContainer(child: StudentsPaymentFormByGender()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsPaymentFormAgeData()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: StudentsPaymentFormCitizenshipData()),
          const SizedBox(height: 20),
          StudentsPaymentFormCourses(),
          StudentsPaymentFormResidenceData(),
        ],
      ),
      onRefresh: () async {
        context.read<StudentsPaymentFormBloc>().add(UpdateStateStudentsPaymentFormEvent());
      },
    );
  }
}

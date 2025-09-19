import 'package:stat_edu_mobile/sources.dart';

class DoctoralStudiesGeneralCategoryScreen extends StatelessWidget {
  const DoctoralStudiesGeneralCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.only(top: 20),
        children: [
          CustomOtmContainer(child: DoctoralStudiesStaticStatisticData()),
          const SizedBox(height: 20),
          CustomOtmContainer(child: DoctoralStudiesOrganizationsData()),
          const SizedBox(height: 20),
          CustomOtmContainer(
            child: DoctoralStudiesEducationOrganizationsData(),
          ),
          const SizedBox(height: 20),
        ],
      ),
      onRefresh: () async{
        context.read<DoctoralStudiesControllerBloc>().add(GetOrganizationsDataDoctoralStudiesControllerEvent(update: true));
        context.read<DoctoralStudiesControllerBloc>().add(GetProvinceOTMAndEducationOrganizationDataDoctoralStudiesControllerEvent(update: true));
      },
    );
  }
}

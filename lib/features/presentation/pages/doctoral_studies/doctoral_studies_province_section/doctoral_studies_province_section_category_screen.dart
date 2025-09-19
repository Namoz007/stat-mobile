import 'package:stat_edu_mobile/sources.dart';

class DoctoralStudiesProvinceSectionCategoryScreen extends StatelessWidget {
  const DoctoralStudiesProvinceSectionCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: ListView(
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.only(top: 20),
        shrinkWrap: true,
        children: [
          CustomOtmContainer(child: DoctoralStudiesProvinceDoctoralAndLeadersCountData()),
        ],
      ),
      onRefresh: () async => context.read<DoctoralStudiesControllerBloc>().add(GetProvinceAndDoctoralCountDataDoctoralStudiesControllerEvent(update: true)),
    );
  }
}

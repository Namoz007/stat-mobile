import 'package:stat_edu_mobile/sources.dart';

class DoctoralStudiesScreen extends StatelessWidget {
  const DoctoralStudiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UniversalAppbar(
              iconOnTap: () {
                context.read<DoctoralStudiesFilterCubit>().showCategory();
              },
              appBarTitle: "Doktorantura",
              appBarHeight: 120,
              showAppBarCategoryContainer: true,
            ),
            Flexible(
              flex: 1,
              child: BlocBuilder<DoctoralStudiesFilterCubit, DoctoralStudiesFilterState>(
                builder: (context, state) {

                  if(state.showCategory){
                    return ShowDoctoralFilterCategory();
                  }

                  switch(state.currentCategory){

                    case DoctoralStudiesFilter.general:
                      return DoctoralStudiesGeneralCategoryScreen();

                    case DoctoralStudiesFilter.provinces_section:
                      return DoctoralStudiesProvinceSectionCategoryScreen();

                    default:
                      return SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

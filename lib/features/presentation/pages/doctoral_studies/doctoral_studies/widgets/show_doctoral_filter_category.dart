import 'package:stat_edu_mobile/sources.dart';

class ShowDoctoralFilterCategory extends StatelessWidget {
  const ShowDoctoralFilterCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child:
          BlocBuilder<DoctoralStudiesFilterCubit, DoctoralStudiesFilterState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getDoctoralStudiesCategoryWithKey(state.currentCategory), style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 12),
                  ListView.builder(
                    itemCount: doctoralStudiesFilterCategories.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: InkWell(
                              onTap: () => context.read<DoctoralStudiesFilterCubit>().updateCategory(doctoralStudiesFilterCategories[index]),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    getDoctoralStudiesCategoryWithKey(doctoralStudiesFilterCategories[index]),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),

                                  doctoralStudiesFilterCategories[index] == state.currentCategory ? Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.greenBarChart,
                                    ),
                                  )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                          index != doctoralStudiesFilterCategories.length - 1
                              ? Divider(color: Colors.black)
                              : SizedBox()
                        ],
                      );
                    },
                  ),
                ],
              );
            },
          ),
    );
  }
}

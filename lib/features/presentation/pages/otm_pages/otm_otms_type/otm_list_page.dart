import 'package:stat_edu_mobile/sources.dart';

class OtmListPage extends StatefulWidget {
  const OtmListPage({super.key});

  @override
  State<OtmListPage> createState() => _OtmListPageState();
}

class _OtmListPageState extends State<OtmListPage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtmControllerBloc, OtmControllerState>(
      builder: (context, i) {
        context.read<OtmDataControllerCubit>().addOTMData(i.universities);
        return BlocBuilder<OtmDataControllerCubit, OTMDataControllerState>(
          builder: (context, state) {
            return ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.all(0),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            if (value.trim().isNotEmpty) {
                              context.read<OtmDataControllerCubit>().searchOTMWithName(value);
                            } else {
                              context.read<OtmDataControllerCubit>().clearSearch();
                            }
                          },
                          controller: controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText:
                                "Oliy ta'lim muassasalarni nomi bo'yicha qidirish...",
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.clear();
                                context
                                    .read<OtmDataControllerCubit>()
                                    .clearSearch();
                              },
                              child: Icon(Icons.cancel),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.decorativeColor),
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.decorativeColor,
                              ),
                              child: DropdownButton(
                                isDense: true,
                                isExpanded: false,
                                underline: const SizedBox(),
                                icon: const SizedBox.shrink(),
                                dropdownColor: AppColors.decorativeColor,
                                value: state.ownershipCategory,
                                items: List.generate(
                                  professionalOwnershipCategoryList.length,
                                      (index) {
                                    return DropdownMenuItem(
                                      value: otmCategoryList[index],
                                      child: Text(
                                        getOtmCategoryTypeName(otmCategoryList[index]),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  },
                                ),
                                onChanged: (value) {
                                  if (value != null) {
                                    context.read<OtmDataControllerCubit>().changeOwnershipCategory(value);
                                  }
                                },
                              ),
                            )

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ShowUniversity(
                      data: state.searchUniversities?[index] ?? state.otmData[index],
                    );
                  },
                  itemCount: state.searchUniversities?.length ?? state.otmData.length,
                ),
              ],
            );
          },
        );
      },
    );
  }
}

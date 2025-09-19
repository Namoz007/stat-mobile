import 'package:stat_edu_mobile/sources.dart';
class ShowUniversity extends StatelessWidget {
  UniversityEntity data;

  ShowUniversity({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<UniversityDataCubit>().removeUniversity(data.id);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(13),
            bottomLeft: Radius.circular(13),
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // data.licencePdfFile.isNotEmpty
                  //     ? Container(
                  //       padding: const EdgeInsets.symmetric(
                  //         horizontal: 9,
                  //         vertical: 6,
                  //       ),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(6),
                  //         color: AppColors.licenseButtonColor,
                  //       ),
                  //       child: Text(
                  //         "Litsenziyasini yuklab olish",
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 12,
                  //           fontWeight: FontWeight.w700,
                  //         ),
                  //       ),
                  //     )
                  //     : const SizedBox(),
                  ShowUniversityType(categoryType: data.categoryType),
                ],
              ),
            ),
            const SizedBox(height: 35),
            BlocBuilder<UniversityDataCubit, UniversityDataState>(
              builder: (context, state) {
                return state.universities.indexWhere(
                          (value) => value.id == data.id,
                        ) ==
                        -1
                    ? Container(
                      width: double.infinity,
                      height: 130,
                      padding: const EdgeInsets.only(
                        right: 10,
                        left: 12,
                        top: 9,
                        bottom: 13,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF000000),
                            blurRadius: 10,
                            spreadRadius: -10,
                            blurStyle: BlurStyle.normal,
                            offset: Offset(00, -10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          UniversityTitleData(data: data),
                          const SizedBox(height: 14),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Color(0xFF2778D5),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      AppLocalizations.of(context)!.statistics,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 45),
                                Expanded(
                                  child: GestureDetector(
                                    onTap:
                                        () => context
                                            .read<UrlLaunchCubit>()
                                            .launchUrl(data.website),
                                    child: Container(
                                      width: double.infinity,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Color(0xFF044085),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        AppLocalizations.of(context)!.officialWebsite,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    : Padding(
                      padding: const EdgeInsets.only(left: 21, right: 9),
                      child: ShowUniversitySocialData(data: data),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

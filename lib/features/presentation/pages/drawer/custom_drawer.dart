import 'package:stat_edu_mobile/sources.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.decorativeColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 68),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: SvgPicture.asset(AppSvgs.statEduIcon)),
                Center(
                  child: Text(
                    "stat.edu.uz",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 53),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    AppLocalizations.of(context)!.settings,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Divider(color: Colors.white),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppSvgs.themIcon),
                          const SizedBox(width: 14),
                          Text(
                            AppLocalizations.of(context)!.app_theme,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppSvgs.languageIcon),
                              const SizedBox(width: 14),
                              Text(
                                AppLocalizations.of(context)!.appLanguage,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          BlocBuilder<LanguageControllerCubit,LanguageControllerState>(
                            builder: (context, state) {
                              return DropdownButton(
                                padding: const EdgeInsets.only(right: 20),
                                value: state.language,
                                dropdownColor: AppColors.decorativeColor,
                                underline: SizedBox.shrink(),
                                icon: SizedBox.shrink(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                items: [
                                  DropdownMenuItem(
                                    value: "en",
                                    child: Text("en"),
                                  ),
                                  DropdownMenuItem(
                                    value: "uz",
                                    child: Text("uz"),
                                  ),
                                  DropdownMenuItem(
                                    value: "ru",
                                    child: Text("ru"),
                                  ),
                                ],
                                onChanged: (value) {
                                  context.read<LanguageControllerCubit>().updateLanguage(value ?? state.language);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () async {
                          try {
                            bool? res =
                                await FlutterPhoneDirectCaller.callNumber(
                                  "+998712031324",
                                );
                            if (res != true) {
                              throw "telefon qilish bo'yicha muammo";
                            }
                          } catch (e) {
                            print("telefon qilishda xatolik yuz berid $e");
                          }
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(AppSvgs.callCenterIcon),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Text(
                                AppLocalizations.of(context)!.call_admin,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      GestureDetector(
                        onTap: () {
                          context.read<UrlLaunchCubit>().launchUrl(
                            "https://stat.edu.uz",
                          );
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(AppSvgs.socialPageIcon),
                            const SizedBox(width: 14),
                            Text(
                              AppLocalizations.of(context)!.officialWebsite,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 8),
            //     child: Row(
            //       children: [
            //         SvgPicture.asset(AppSvgs.splashBookIcon),
            //         const SizedBox(width: 8,),
            //         Expanded(child: Text("Raqamli ta’lim texnologiyalarni rivojlantirish markazi",style: TextStyle(fontSize: 16,color: Colors.white,),))
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

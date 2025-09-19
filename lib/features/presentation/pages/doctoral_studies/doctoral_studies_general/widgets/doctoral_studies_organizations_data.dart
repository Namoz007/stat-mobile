import 'package:stat_edu_mobile/sources.dart';

class DoctoralStudiesOrganizationsData extends StatefulWidget {
  const DoctoralStudiesOrganizationsData({super.key});

  @override
  State<DoctoralStudiesOrganizationsData> createState() =>
      _DoctoralStudiesOrganizationsDataState();
}

class _DoctoralStudiesOrganizationsDataState
    extends State<DoctoralStudiesOrganizationsData> {
  @override
  void initState() {
    super.initState();
    context.read<DoctoralStudiesControllerBloc>().add(
      GetOrganizationsDataDoctoralStudiesControllerEvent(update: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
        DoctoralStudiesControllerBloc,
        DoctoralStudiesControllerState
    >(
      builder: (context, state) {
        if (state.organizationsData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tashkilotlar",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Tashkilot turlari",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Tashkilot soni",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Biriktirilgan adminlar soni",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Center(
                        child: Text(
                          "Oliy ta'lim muassasalari",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Center(
                      child: Text(
                        state.organizationsData.indexWhere((value) =>
                        value.type_org_id == 100) != -1 ? state.organizationsData[state.organizationsData.indexWhere((value) =>
                        value.type_org_id == 100)!].org_count.toString() : '0',
                        style: TextStyle(fontWeight: FontWeight.w700,),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Center(
                      child: Text(
                        state.organizationsData.indexWhere((value) =>
                        value.type_org_id == 100) != -1 ? state.organizationsData[state.organizationsData.indexWhere((value) =>
                        value.type_org_id == 100)!].usr_org_count.toString() : '0',
                        style: TextStyle(fontWeight: FontWeight.w700,),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Ilmiy tashkilotlar",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Center(
                      child: Text(
                        state.organizationsData.indexWhere((value) =>
                        value.type_org_id == 200) != -1 ? state.organizationsData[state.organizationsData.indexWhere((value) =>
                        value.type_org_id == 200)!].org_count.toString() : '0',
                        style: TextStyle(fontWeight: FontWeight.w700,),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Center(
                      child: Text(
                        state.organizationsData.indexWhere((value) =>
                        value.type_org_id == 200) != -1 ? state.organizationsData[state.organizationsData.indexWhere((value) =>
                        value.type_org_id == 200)!].usr_org_count.toString() : '0',
                        style: TextStyle(fontWeight: FontWeight.w700,),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Vazirliklar",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Center(
                      child: Text(
                        state.organizationsData.indexWhere((value) =>
                        value.type_org_id == 300) != -1 ? state.organizationsData[state.organizationsData.indexWhere((value) =>
                        value.type_org_id == 300)!].org_count.toString() : '0',
                        style: TextStyle(fontWeight: FontWeight.w700,),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Center(
                      child: Text(
                        state.organizationsData.indexWhere((value) =>
                        value.type_org_id == 100) != -1 ? state.organizationsData[state.organizationsData.indexWhere((value) =>
                        value.type_org_id == 100)!].usr_org_count.toString() : '0',
                        style: TextStyle(fontWeight: FontWeight.w700,),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
            ],
          );
        } else {
          return ShowLoadingWidget(
            title: "Tashkilotlar",
            titleColor: Colors.black,
          );
        }
      },
    );
  }
}

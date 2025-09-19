import 'package:stat_edu_mobile/sources.dart';

class ShowAcceptanceAcceptancesData extends StatefulWidget {
  List<String> title;
  List<Map<String,int>> acceptanceData;
  ShowAcceptanceAcceptancesData({super.key,required this.title,required this.acceptanceData,});

  @override
  State<ShowAcceptanceAcceptancesData> createState() => _ShowAcceptanceAcceptancesDataState();
}

class _ShowAcceptanceAcceptancesDataState extends State<ShowAcceptanceAcceptancesData> {
  int titleIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16,),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  if(titleIndex != 0){
                    setState(() {
                      --titleIndex;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 11,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.acceptanceCategoryIconColor,
                  ),
                  child: SvgPicture.asset(AppSvgs.arrowLeftIcon),
                ),
              ),
              Text(
                widget.title[titleIndex],
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              GestureDetector(
                onTap: (){
                  if(widget.title.length-1 != titleIndex){
                    setState(() {
                      ++titleIndex;
                    });
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 11,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.acceptanceCategoryIconColor,
                  ),
                  child: SvgPicture.asset(AppSvgs.arrowRightIcon),
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          Divider(color: Colors.black),
          const SizedBox(height: 12),
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: widget.acceptanceData[titleIndex].keys.toList().length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.acceptanceCircleContainerColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(widget.acceptanceData[titleIndex].keys.toList()[index]),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color:
                              AppColors.acceptanceStatisticLightGreenColor,
                            ),
                          ),
                          Container(
                            width:
                            MediaQuery.of(context).size.width *
                                0.6 *
                                calculatePercent(
                                  widget.acceptanceData[titleIndex].values.toList().reduce(
                                        (a, b) => a + b,
                                  ),
                                  widget.acceptanceData[titleIndex].values.toList()[index],
                                ),
                            height: 18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: AppColors.acceptanceCircleContainerColor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                        decoration: BoxDecoration(
                            color: AppColors.acceptanceStatisticLightGreenColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: AppColors.acceptanceCircleContainerColor)
                        ),
                        child: Text(
                          formatNumber(widget.acceptanceData[titleIndex].values.toList()[index]),
                          style: TextStyle(
                            color: AppColors.acceptanceCircleContainerColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 12,),
        ],
      ),
    );
  }
}

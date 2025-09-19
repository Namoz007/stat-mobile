import 'package:stat_edu_mobile/sources.dart';

class ShowLoadingWidget extends StatelessWidget {
  String title;
  Color titleColor;

  ShowLoadingWidget({super.key, required this.title, required this.titleColor});

  List<double> paddingWidth = [
    20,
    50,
    30,
    100,
    70,
    80
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: paddingWidth.length,
          itemBuilder: (context,index){
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.white,
            child: Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(3),
              ),
              margin: EdgeInsets.only(right: paddingWidth[index],bottom: 12),
            ),
          );
        },),
        const SizedBox(height: 20,),
      ],
    );
  }
}

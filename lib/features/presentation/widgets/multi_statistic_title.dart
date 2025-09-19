import 'package:stat_edu_mobile/sources.dart';

class MultiStatisticTitle extends StatelessWidget {
  List<String> title;
  List<Color> titleColors;
  MultiStatisticTitle({super.key,required this.title,required this.titleColors,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(title.length, (index){

        return Row(
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: titleColors[index],
              ),
            ),
            const SizedBox(width: 10,),
            Text(
              getTranslateWord(context: context, value: title[index]),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppColors.decorativeColor,
              ),
            ),
          ],
        );
      },),
    );
  }
}

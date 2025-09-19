import 'package:stat_edu_mobile/sources.dart';

class ShowRectangleTitle extends StatelessWidget {
  List<String> title;
  List<Color> colors;
  Color titleColor;

  ShowRectangleTitle({
    super.key,
    required this.title,
    required this.colors,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: title.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Container(
                height: 12,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: colors[index],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                getTranslateWord(context: context, value: title[index]),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:stat_edu_mobile/sources.dart';

class DoctoralStudiesStaticStatisticData extends StatelessWidget {
  const DoctoralStudiesStaticStatisticData({super.key});

  Widget _buildStatItem(String title, String subtitle,bool showDivider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 12),
        showDivider ?  const Divider() : const SizedBox(),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Statistika doktorantura",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,),),
        const SizedBox(height: 12,),
        _buildStatItem("Izlanuvchilar soni (DSc)", "40 yoshdan oshmagan",true),
        _buildStatItem("Ayol izlanuvchilar soni (DSc)", "40 yoshdan oshmagan",true),
        _buildStatItem("Erkak izlanuvchilar soni (DSc)", "40 yoshdan oshmagan",true),
        _buildStatItem("Izlanuvchilar soni (PhD)", "40 yoshdan oshmagan",true),
        _buildStatItem("Ayol izlanuvchilar soni (PhD)", "40 yoshdan oshmagan",true),
        _buildStatItem("Erkak izlanuvchilar soni (PhD)", "40 yoshdan oshmagan",true),
        _buildStatItem("umuiy izlanuvchilar osni", "Hammasi",false),

      ],
    );
  }
}

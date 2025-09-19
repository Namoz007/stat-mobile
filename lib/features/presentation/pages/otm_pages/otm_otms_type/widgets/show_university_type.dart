import 'package:stat_edu_mobile/sources.dart';
class ShowUniversityType extends StatelessWidget {
  OtmCategoryType categoryType;
  ShowUniversityType({super.key,required this.categoryType,});

  @override
  Widget build(BuildContext context) {
    
    switch(categoryType){
      
      case OtmCategoryType.governmental:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(width: 1,color: AppColors.mainColor),
          ),
          child: Text(AppLocalizations.of(context)!.governmental,style: TextStyle(fontSize: 12,color: AppColors.mainColor),),
        );
      
      case OtmCategoryType.nongovernmental:
        
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 3),
          decoration: BoxDecoration(
            color: Color(0xFFCED93C),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1,color: Color(0xFFC9FB00)),
          ),
          child: Text(AppLocalizations.of(context)!.nonGovernmental,style: TextStyle(fontSize: 12,color: Colors.white,),),
        );
        
      default:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1,color: AppColors.mainColor),
          ),
          child: Text(AppLocalizations.of(context)!.foreign,style: TextStyle(fontSize: 12),),
        );
    }
  }
}

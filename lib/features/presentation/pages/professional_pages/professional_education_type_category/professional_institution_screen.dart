import 'package:stat_edu_mobile/sources.dart';

class ProfessionalInstitutionScreen extends StatefulWidget {
  const ProfessionalInstitutionScreen({super.key});

  @override
  State<ProfessionalInstitutionScreen> createState() => _ProfessionalInstitutionScreenState();
}

class _ProfessionalInstitutionScreenState extends State<ProfessionalInstitutionScreen> {
  late TextEditingController controller;
  
  @override
  void initState() {
    super.initState();
    context.read<ProfessionalInstitutionControllerCubit>().getInstitutions(false);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.maxFinite,
      color: Colors.white,
      child: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 20,left: 16,right: 16,),
        children: [
          Text(AppLocalizations.of(context)!.vocationalInstitutionsList,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: AppColors.professionalDecorativeColor,),),
          const SizedBox(height: 12,),
          BlocBuilder<ProfessionalInstitutionControllerCubit,ProfessionalInstitutionControllerState>(builder: (context,state){
            return Column(
              children: [
                TextFormField(
                  onChanged: (value){
                    if(value.isEmpty){
                      context.read<ProfessionalInstitutionControllerCubit>().searchInstitutionsWithName(null);
                    }else{
                      context.read<ProfessionalInstitutionControllerCubit>().searchInstitutionsWithName(value);
                    }
                  },
                  enabled: !state.loading,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.search),

                    hintText: AppLocalizations.of(context)!.searchInstitutionHint,
                  ),
                ),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: ProfessionalStudentsInstitutionOwnershipCategory()),
                    const SizedBox(width: 12,),
                    Expanded(child: ProfessionalStudentsEducationTypeCategory()),
                  ],
                ),
                const SizedBox(height: 8,),
                ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  itemCount: state.searchInstitutions?.length ?? state.institutions.length,
                  itemBuilder: (context,index){
                  return Padding(padding: const EdgeInsets.symmetric(vertical: 12),child: ShowInstitutionData(data: state.searchInstitutions?[index] ?? state.institutions[index],),);
                },),
              ],
            );
          },)
        ],
      ),
    );
  }
}

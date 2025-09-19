import 'package:stat_edu_mobile/sources.dart';
part 'professional_tabbar_controller_state.dart';

class ProfessionalTabbarControllerCubit extends Cubit<ProfessionalTabBarControllerState> {
  ProfessionalTabbarControllerCubit() : super(ProfessionalTabBarControllerState(index: 0));

  void newIndex(int index){
    emit(ProfessionalTabBarControllerState(index: index));
  }
}

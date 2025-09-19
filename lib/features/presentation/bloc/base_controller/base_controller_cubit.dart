import 'package:stat_edu_mobile/sources.dart';
part 'base_controller_state.dart';

class BaseControllerCubit extends Cubit<BaseControllerState> {
  BaseControllerCubit() : super(BaseControllerState(screenIndex: 0));


  void updateScreen(int index){
    emit(BaseControllerState(screenIndex: index));
  }
}

import 'package:stat_edu_mobile/sources.dart';
part 'language_controller_state.dart';

class LanguageControllerCubit extends Cubit<LanguageControllerState> {
  LanguageControllerCubit() : super(LanguageControllerState.initialState());

  void updateLanguage(String language){
    emit(state.copyWith(newLanguage: language));
  }

}

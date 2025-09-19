part of 'language_controller_cubit.dart';

class LanguageControllerState {
  String language;

  LanguageControllerState({required this.language});

  LanguageControllerState copyWith({String? newLanguage}) =>
      LanguageControllerState(language: newLanguage ?? language);

  factory LanguageControllerState.initialState() => LanguageControllerState(language: 'uz');

}

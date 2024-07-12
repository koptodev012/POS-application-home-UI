import 'package:bloc/bloc.dart';
import 'package:home_design/common/variables.dart';
import 'package:meta/meta.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial()) {
    isChangedThemeFunction(CommonVariables.isDarkMode);
  }

  void isChangedThemeFunction(bool value) {
    emit(ChangeThemeSuccessState(isThemeMode: value));
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_design/common/variables.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial()) {
    isChangedThemeFunction(CommonVariables.isDarkMode);
  }

  void isChangedThemeFunction(bool value) {
    emit(ChangeThemeSuccessState(isThemeMode: value));
  }
}

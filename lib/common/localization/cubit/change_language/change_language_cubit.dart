import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());

  void ChangelanguageFunction(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    if (type == const Locale('en')) {
      // await sp.setString("language", 'en');
      emit(ChangeLanguageSuccess(const Locale('en')));
    } else {
      // await sp.setString("language", 'ar');
      emit(ChangeLanguageSuccess(const Locale('ar')));
    }
  }
}

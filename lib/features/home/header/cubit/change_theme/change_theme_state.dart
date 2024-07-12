part of 'change_theme_cubit.dart';

@immutable
sealed class ChangeThemeState {}

final class ChangeThemeInitial extends ChangeThemeState {}

final class ChangeThemeSuccessState extends ChangeThemeState {
  final bool isThemeMode;

  ChangeThemeSuccessState({required this.isThemeMode});
}

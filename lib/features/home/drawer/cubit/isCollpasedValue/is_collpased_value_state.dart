part of 'is_collpased_value_cubit.dart';

@immutable
sealed class IsCollpasedValueState {}

final class IsCollpasedValueInitial extends IsCollpasedValueState {}

final class IsCollpasedValueSuccessState extends IsCollpasedValueState {
  bool boolValue;

  IsCollpasedValueSuccessState({required this.boolValue});
}

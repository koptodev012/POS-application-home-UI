import 'package:bloc/bloc.dart';
import 'package:home_design/common/variables.dart';
import 'package:meta/meta.dart';

part 'is_collpased_value_state.dart';

class IsCollpasedValueCubit extends Cubit<IsCollpasedValueState> {
  IsCollpasedValueCubit() : super(IsCollpasedValueInitial()) {
    setIsCollapsed(CommonVariables.isCollapsed);
  }

  void setIsCollapsed(bool value) {
    emit(IsCollpasedValueSuccessState(boolValue: value));
  }
}

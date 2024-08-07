import 'package:flutter_bloc/flutter_bloc.dart';

part 'successul_place_order_icon_state.dart';

class SuccessulPlaceOrderIconCubit extends Cubit<SuccessulPlaceOrderIconState> {
  SuccessulPlaceOrderIconCubit() : super(SuccessulPlaceOrderIconInitial());

  void placeOrderSuccessFunction() async {
    emit(placeOrderSuccessState());

    return await Future.delayed(const Duration(seconds: 4), () {
      emit(SuccessulPlaceOrderIconInitial());
    });
  }
}

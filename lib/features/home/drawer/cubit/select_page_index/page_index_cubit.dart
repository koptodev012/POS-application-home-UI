
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_design/common/variables.dart';


part 'page_index_state.dart';

class PageIndexCubit extends Cubit<PageIndexState> {
  PageIndexCubit() : super(PageIndexInitial()) {
    selectPageIndexFunction();
  }

  void selectPageIndexFunction() {
    if (CommonVariables.selectIndex == null) {
      CommonVariables.selectIndex = 0;

      emit(PageIndexSuccessState(pageIndex: CommonVariables.selectIndex!));
    } else {
      emit(PageIndexSuccessState(pageIndex: CommonVariables.selectIndex!));
    }
  }
}

part of 'page_index_cubit.dart';

sealed class PageIndexState {}

final class PageIndexInitial extends PageIndexState {}

final class PageIndexSuccessState extends PageIndexState {
  int pageIndex;
  PageIndexSuccessState({required this.pageIndex});
}

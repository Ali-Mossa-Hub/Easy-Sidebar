import '../../../src/core/get_it/get_it_files.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/middleware/sidebar_middleware.dart';

part 'select_item_state.dart';

///
class SelectItemCubit extends Cubit<SelectItemState> {
  ///
  final sidebarMiddleware = GetItFiles.getItInstance()<SidebarMiddleware>();

  ///
  SelectItemCubit() : super(SelectItemInitial());

  /// pushing new page
  void changePage(Widget page, {bool isSidebarItem = false}) {
    emit(LoadingSelectItemState());
    try {
      sidebarMiddleware.moveToAnotherPage(page, isSidebarItem: isSidebarItem);
      emit(SuccessSelectItemState(page: page));
    } catch (error) {
      sidebarMiddleware.printErrorMessage(
        error.toString(),
        errorType: 'MoveToNewPage',
      );
      emit(FailedSelectItemState());
    }
  }

  /// removing current page
  void removeCurrentPage() {
    emit(LoadingRemovePageState());
    try {
      sidebarMiddleware.removeLastPage();
      emit(SuccessRemovePageState(page: sidebarMiddleware.getCurrentPage()));
    } catch (error) {
      sidebarMiddleware.printErrorMessage(
        error.toString(),
        errorType: 'PopOldPage',
      );
      emit(FailedRemovePageState());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../util/errors/scope_error.dart';
import '../../logic/slect_item/select_item_cubit.dart';

/// Public API for page navigation
class HandlePages {
  SelectItemCubit? _selectItemCubit;

  /// navigate to another page
  Future<void> pushPage(BuildContext context, Widget page) async {
    try {
      _selectItemCubit ??= context.read<SelectItemCubit>();

      _selectItemCubit!.changePage(page);
    } catch (error) {
      throw ScopeError(
        'You can not use push pages out side the slide\'s pages and her children',
      );
    }
  }

  /// remove current page from stack
  void popPage(BuildContext context) {
    try {
      if (_selectItemCubit != null) {
        _selectItemCubit!.removeCurrentPage();
      } else {
        _selectItemCubit ??= context.read<SelectItemCubit>();
        _selectItemCubit!.removeCurrentPage();
      }
    } catch (error) {
      throw ScopeError(
        'You can not use pop pages out side the sidebar\'s pages and her children',
      );
    }
  }
}

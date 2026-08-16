import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'change_sidebar_width_state.dart';

///
class ChangeSidebarWidthCubit extends Cubit<ChangeSidebarWidthState> {
  ///
  ChangeSidebarWidthCubit() : super(ChangeSidebarWidthInitial());

  /// change sidebar widget width
  void changeSidebarWidth(double sidebarWidth, bool isExpand) {
    emit(LoadingChangeSidebarState());
    emit(
      SuccessChangeSidebarState(
        sidebarWidth: sidebarWidth,
        isExpand: !isExpand,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../main_page/main_page_scops/main_page_scop.dart';
import '../../logic/change_sidebar_width/change_sidebar_width_cubit.dart';

// ignore: must_be_immutable
class SidebarIconButton extends StatelessWidget {
  double? maxWidth;
  double? minWidth;
  final Widget expandIcon;
  final Widget collapseIcon;
  SidebarIconButton({
    this.expandIcon = const Icon(Icons.keyboard_arrow_right_rounded),
    this.collapseIcon = const Icon(Icons.keyboard_arrow_left_rounded),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selectItemCubit = context.read<ChangeSidebarWidthCubit>();
    final mainPageScop = MainPageScop.of(context);
    final direction = Directionality.of(context);
    return BlocSelector<ChangeSidebarWidthCubit, ChangeSidebarWidthState, bool>(
      key: Key('sidebar_icon_button_key'),
      builder: (_, isExpand) => Row(
        mainAxisAlignment: .end,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedSwitcher(
                duration: mainPageScop.duration,
                reverseDuration: mainPageScop.duration,
                switchInCurve: mainPageScop.curve,
                switchOutCurve: mainPageScop.curve,
                child: IconButton(
                  key: ValueKey(isExpand),
                  onPressed: () => selectItemCubit.changeSidebarWidth(
                    isExpand ? maxWidth! : minWidth!,
                    isExpand,
                  ),
                  icon: mainPageScop.selectItemCubit.sidebarMiddleware
                      .returnRightIconButton(
                        expandIcon,
                        collapseIcon,
                        direction,
                        isExpand,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
      selector: (ChangeSidebarWidthState state) {
        if (state is SuccessChangeSidebarState) {
          return state.isExpand;
        }
        return false;
      },
    );
  }
}

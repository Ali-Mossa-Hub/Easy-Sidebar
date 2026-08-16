import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../sidebar_scops/sidebar_scop.dart';
import '../sidbar_item_widget/sidebar_item.dart';
import '../../../constants/default_durations.dart';
import '../../buttons/sidebar_icon_button.dart';
import '../../../util/enums/sidebar_animation.dart';
import '../../../logic/slect_item/select_item_cubit.dart';
import '../../../logic/change_sidebar_width/change_sidebar_width_cubit.dart';

/// Sidebar widget class
class Sidebar extends StatelessWidget {
  ///
  final double maxWidth;

  ///
  final double minWidth;

  /// Usually used with logos
  final Widget topSidebar;

  ///
  final Gradient? gradient;

  ///
  final Curve sideBarItemCurve;

  ///
  final Color? backgroundColor;

  ///
  final Duration sideBarDuration;

  /// Changing sidebar items animtion
  final SideBarAnimation animation;

  /// Changing sidebar items animtion duration
  final Duration sideBarItemDuration;

  ///
  final BorderRadiusGeometry borderRadius;

  ///
  final List<SidebarItem> listSidebarItems;

  ///
  final EdgeInsetsDirectional sidebarMargin;

  /// Collaps/Expand sidebar icon button
  final SidebarIconButton? sidebarIconButton;

  /// Create sidebar widget
  const Sidebar({
    required this.listSidebarItems,
    this.maxWidth = 200,
    this.minWidth = 100,
    this.topSidebar = const SizedBox(),
    this.borderRadius = const BorderRadiusDirectional.only(
      bottomEnd: Radius.circular(10),
      topEnd: Radius.circular(10),
    ),
    this.sideBarItemCurve = Curves.ease,
    this.sideBarDuration = DefaultDurations.defaultSidebarDuration,
    this.animation = SideBarAnimation.none,
    this.sideBarItemDuration = DefaultDurations.defaultSidebarItemDuration,
    this.sidebarMargin = const EdgeInsetsDirectional.only(top: 0, bottom: 10),
    this.gradient,
    this.backgroundColor,
    this.sidebarIconButton,
    super.key,
  }) : assert(
         ((maxWidth != minWidth) || (maxWidth < minWidth)) && (minWidth >= 50),
         'The width is not recommended',
       ),
       assert(
         (backgroundColor == null) || (gradient == null),
         'one of backgroundColor and gradient should be null',
       );

  @override
  Widget build(BuildContext context) {
    final selectItemCubit = context.read<SelectItemCubit>();

    return SidebarScop(
      averageWidth: maxWidth - minWidth,
      curve: sideBarItemCurve,
      duration: sideBarItemDuration,
      animation: animation,
      selectItemCubit: selectItemCubit,
      child: Column(
        children: [
          Expanded(
            child:
                BlocSelector<
                  ChangeSidebarWidthCubit,
                  ChangeSidebarWidthState,
                  double
                >(
                  selector: (state) {
                    if (state is SuccessChangeSidebarState) {
                      return state.sidebarWidth;
                    }
                    return maxWidth;
                  },
                  builder: (context, width) {
                    return AnimatedContainer(
                      key: Key('animated_container_sidebar_widget_key'),
                      duration: sideBarDuration,
                      margin: sidebarMargin,
                      decoration: BoxDecoration(
                        gradient: gradient,
                        borderRadius: borderRadius,
                        color: backgroundColor,
                      ),
                      width: width,
                      child: Column(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: const ScrollBehavior().copyWith(
                                scrollbars: false,
                              ),
                              child: ListView(
                                physics: const RangeMaintainingScrollPhysics(),
                                shrinkWrap: true,
                                //  clipBehavior: Clip.hardEdge,
                                children: [topSidebar, ...listSidebarItems],
                              ),
                            ),
                          ),
                          if (sidebarIconButton != null)
                            sidebarIconButton!
                              ..maxWidth = maxWidth
                              ..minWidth = minWidth,
                        ],
                      ),
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}

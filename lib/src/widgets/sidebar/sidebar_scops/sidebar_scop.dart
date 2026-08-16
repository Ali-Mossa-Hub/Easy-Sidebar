import 'package:flutter/material.dart';
import '../../../util/enums/sidebar_animation.dart';
import '../../../logic/slect_item/select_item_cubit.dart';

///
class SidebarScop extends InheritedWidget {
  /// notice changes of sidebar width
  final double averageWidth;

  ///
  final Curve curve;

  ///
  final Duration duration;

  /// The animation type
  final SideBarAnimation animation;

  /// SelectItemCubit instance
  final SelectItemCubit selectItemCubit;

  /// Create sidebar scop

  const SidebarScop({
    super.key,
    required this.averageWidth,
    required this.curve,
    required this.duration,
    required this.animation,
    required this.selectItemCubit,

    required super.child,
  });

  ///
  static SidebarScop of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<SidebarScop>() as SidebarScop;
  @override
  bool updateShouldNotify(SidebarScop oldWidget) {
    return averageWidth != oldWidget.averageWidth;
  }
}

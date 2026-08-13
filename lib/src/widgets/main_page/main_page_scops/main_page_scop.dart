import 'package:flutter/material.dart';
import '../../../logic/slect_item/select_item_cubit.dart';

class MainPageScop extends InheritedWidget {
  final Duration duration;
  final Curve curve;
  final SelectItemCubit selectItemCubit;
  const MainPageScop({
    super.key,
    required this.duration,
    required this.curve,
    required this.selectItemCubit,
    required super.child,
  });

  static MainPageScop of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<MainPageScop>() as MainPageScop;
  @override
  bool updateShouldNotify(covariant MainPageScop oldWidget) {
    return (duration != oldWidget.duration) || (curve != oldWidget.curve);
  }
}

import 'package:flutter/material.dart';

class GeneralPageAnimation extends StatelessWidget {
  final Curve curve;
  final Widget page;
  final bool nonAnimated;
  final Duration duration;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;
  const GeneralPageAnimation({
    required this.curve,
    required this.page,
    required this.duration,
    required this.nonAnimated,
    required this.transitionBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return !nonAnimated
        ? AnimatedSwitcher(
            duration: duration,
            reverseDuration: duration,
            switchInCurve: curve,
            switchOutCurve: curve,
            transitionBuilder: transitionBuilder,
            child: page,
          )
        : AnimatedSwitcher(duration: const Duration(), child: page);
  }
}

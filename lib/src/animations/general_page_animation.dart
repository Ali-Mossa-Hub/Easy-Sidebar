import 'package:flutter/material.dart';

/// the animation of navigation pages and
///  changin side bar items
///
class GeneralPageAnimation extends StatelessWidget {
  /// Animatoin curve
  final Curve curve;

  /// The navigated page
  final Widget page;

  /// iF there no need animation
  final bool nonAnimated;

  /// Animation duration
  final Duration duration;

  /// The animation effect type
  final AnimatedSwitcherTransitionBuilder transitionBuilder;

  /// Create the animation widget
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

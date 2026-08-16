import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../util/errors/page_error.dart';
import '../../util/enums/sidebar_animation.dart';
import '../../logic/slect_item/select_item_cubit.dart';

///
class SidebarMiddleware {
  final List<Function> _pages = [];

  /// check the if tow of widgets are equal
  bool isEqual(Widget firstWidget, Widget secondtWidget) =>
      firstWidget.hashCode == secondtWidget.hashCode;

  /// hide item title when its null or empty
  bool returnHideTitleOnCollaps(String? title) =>
      (title == null || title.isEmpty);

  /// check the current page
  Widget getCurrentPage() {
    if (_pages.isEmpty) {
      throw PageError("pages list is empty");
    }
    return _pages.last();
  }

  /// get customized animation
  Widget getSideBarAnimation(
    Widget widget,
    Animation<double> animation,
    SideBarAnimation mainSideBarAnimation, {
    bool isSidebarItem = false,
  }) {
    switch (mainSideBarAnimation) {
      case SideBarAnimation.none:
        return widget;
      case SideBarAnimation.fade:
        return FadeTransition(opacity: animation, child: widget);
      case SideBarAnimation.scale:
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(
            opacity: animation,
            child: FadeTransition(opacity: animation, child: widget),
          ),
        );
      case SideBarAnimation.slide:
        return SlideTransition(
          position: Tween<Offset>(
            begin: isSidebarItem ? Offset(.2, 0) : Offset(1, 0),
            end: Offset(0, 0),
          ).animate(animation),
          transformHitTests: false,
          child: FadeTransition(opacity: animation, child: widget),
        );
      case SideBarAnimation.rotation:
        return RotationTransition(
          turns: Tween<double>(begin: .35, end: 0).animate(animation),
          filterQuality: FilterQuality.none,
          child: FadeTransition(opacity: animation, child: widget),
        );
      case SideBarAnimation.sized:
        return SizeTransition(
          sizeFactor: Tween<double>(begin: .3, end: 1).animate(animation),
          child: FadeTransition(opacity: animation, child: widget),
        );
    }
  }

  /// return the right page depend on SelectItemState state
  Widget returnBlocSelectorSelectItemState(SelectItemState selectItemState) {
    if (selectItemState is SuccessSelectItemState) {
      return selectItemState.page;
    } else if (selectItemState is SuccessRemovePageState) {
      return selectItemState.page;
    } else {
      return const SizedBox();
    }
  }

  /// return sidebar correct icon
  Widget returnRightIconButton(
    Widget expandIcon,
    Widget collapseIcon,
    TextDirection direction,
    bool isExpand,
  ) => direction == TextDirection.ltr
      ? isExpand
            ? expandIcon
            : collapseIcon
      : isExpand
      ? collapseIcon
      : expandIcon;

  /// return sidebar item text style
  TextStyle returnTextStyle(
    Widget selectedWidget,
    Widget page,
    TextStyle? textStyle,
    TextStyle defaultTextStyle,
    Color selectColor,
  ) => isEqual(selectedWidget, page)
      ? (textStyle != null
            ? textStyle.copyWith(backgroundColor: selectColor)
            : defaultTextStyle.copyWith(color: selectColor))
      : textStyle ?? defaultTextStyle;

  /// navigate to another page
  void moveToAnotherPage(Widget page, {bool isSidebarItem = false}) {
    if (isSidebarItem) {
      _pages.clear();
    }
    _pages.add(() => page);
  }

  /// printing Error function
  void printErrorMessage(String errorMessage, {String errorType = ''}) {
    if (kDebugMode) {
      final errorTypeMessage = errorType.isNotEmpty
          ? "ErrorType is : $errorType"
          : '';
      print("$errorTypeMessage \n ErrorMessage is : $errorMessage");
    }
  }

  /// remove the last navigated page
  void removeLastPage() => _pages.removeLast();
}

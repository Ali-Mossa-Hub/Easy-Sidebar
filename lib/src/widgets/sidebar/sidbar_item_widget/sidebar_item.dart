import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './sidebar_item_widget.dart';
import '../sidebar_scops/sidebar_scop.dart';
import '../../../constants/default_colors.dart';
import '../../../constants/defualt_margin.dart';
import '../../../constants/default_padding.dart';
import '../../../util/enums/sidebar_animation.dart';
import '../../../constants/default_border_raduis.dart';
import '../../../animations/general_page_animation.dart';
import '../../../logic/slect_item/select_item_cubit.dart';

///
class SidebarItem extends StatelessWidget {
  ///
  final Widget icon;

  /// The connected page with current item
  final Widget page;

  ///
  final String? title;

  ///
  final Color? iconColor;

  ///
  final double? iconSize;

  ///
  final Color? hoverColor;

  ///
  final Color selectColor;

  ///
  final double borderRadius;

  ///
  final TextStyle? textStyle;

  ///
  final Color selectBackgroundColor;

  ///
  final EdgeInsetsDirectional itemMargin;

  ///
  final EdgeInsetsDirectional itemPadding;

  /// Create sidebar item
  const SidebarItem({
    required this.icon,
    required this.page,
    this.selectColor = DefaultColors.selectSidebarItemColor,
    this.borderRadius = DefaultBorderRaduis.sidebarItemBorderRaduis,
    this.selectBackgroundColor = DefaultColors.selectSidebarItemBackgroundColor,
    this.iconSize,
    this.itemMargin = DefualtMargin.defaultSidebarItemMargin,
    this.itemPadding = DefaultPadding.defaultSidebarItemPadding,
    this.title,
    this.iconColor,
    this.hoverColor,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sidebarScop = SidebarScop.of(context);
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    final selectItemCubit = sidebarScop.selectItemCubit;
    final iconThem = IconTheme.of(context);
    return BlocSelector<SelectItemCubit, SelectItemState, Widget>(
      selector:
          selectItemCubit.sidebarMiddleware.returnBlocSelectorSelectItemState,
      builder: (context, selectedWidget) {
        return GeneralPageAnimation(
          curve: sidebarScop.curve,
          duration: sidebarScop.duration,
          nonAnimated: sidebarScop.animation == SideBarAnimation.none,
          transitionBuilder: (child, animation) =>
              selectItemCubit.sidebarMiddleware.getSideBarAnimation(
                child,
                animation,
                sidebarScop.animation,
                isSidebarItem: true,
              ),
          page: SidebarItemWidget(
            key: ValueKey(
              selectItemCubit.sidebarMiddleware.isEqual(selectedWidget, page),
            ),
            icon: icon,
            page: page,
            title: title,
            iconColor: iconColor,
            iconSize: iconSize,
            hoverColor: hoverColor,
            selectColor: selectColor,
            borderRadius: borderRadius,
            textStyle: textStyle,
            selectedWidget: selectedWidget,
            hideTitleOnCollaps: sidebarScop.selectItemCubit.sidebarMiddleware
                .returnHideTitleOnCollaps(title),
            selectBackgroundColor: selectBackgroundColor,
            selectItemCubit: selectItemCubit,
            itemMargin: itemMargin,
            itemPadding: itemPadding,
            defaultTextStyle: defaultTextStyle,
            iconThemeData: iconThem,
          ),
        );
      },
    );
  }
}

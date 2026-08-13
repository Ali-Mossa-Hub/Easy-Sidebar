import 'package:flutter/material.dart';
import '../../../constants/default_colors.dart';
import '../../../constants/default_durations.dart';
import '../../../constants/default_text_control.dart';
import '../../../logic/slect_item/select_item_cubit.dart';

class SidebarItemWidget extends StatelessWidget {
  final Widget icon;
  final Widget page;
  final String? title;
  final Color? iconColor;
  final double? iconSize;
  final Color? hoverColor;
  final Color selectColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final Widget selectedWidget;
  final bool hideTitleOnCollaps;
  final Color selectBackgroundColor;
  final SelectItemCubit selectItemCubit;
  final EdgeInsetsDirectional itemMargin;
  final EdgeInsetsDirectional itemPadding;
  final TextStyle defaultTextStyle;
  final IconThemeData iconThemeData;

  const SidebarItemWidget({
    required this.icon,
    required this.page,
    required this.title,
    required this.iconColor,
    required this.iconSize,
    required this.hoverColor,
    required this.selectColor,
    required this.borderRadius,
    required this.textStyle,
    required this.selectedWidget,
    required this.hideTitleOnCollaps,
    required this.selectBackgroundColor,
    required this.selectItemCubit,
    required this.itemMargin,
    required this.itemPadding,
    required this.defaultTextStyle,
    required this.iconThemeData,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: itemMargin,
      child: Material(
        animateColor: true,
        animationDuration: DefaultDurations.defaultMaterialWidgetDuratoin,
        borderRadius: BorderRadius.circular(borderRadius),
        color: selectItemCubit.sidebarMiddleware.isEqual(selectedWidget, page)
            ? selectBackgroundColor
            : DefaultColors.unSelectSidebarItemBackgroundColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          mouseCursor: SystemMouseCursors.click,
          hoverColor: hoverColor ?? DefaultColors.hoverSidebarItemColor,
          onTap: () => selectItemCubit.changePage(page, isSidebarItem: true),
          child: Padding(
            padding: itemPadding,
            child: !hideTitleOnCollaps
                ? Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title!,
                          style: selectItemCubit.sidebarMiddleware
                              .returnTextStyle(
                                selectedWidget,
                                page,
                                textStyle,
                                defaultTextStyle,
                                selectColor,
                              ),
                          overflow: DefaultTextControl.defaultTextEllipsis,
                        ),
                      ),
                      IconTheme(
                        data: IconThemeData(
                          size: iconSize ?? iconThemeData.size,
                          color:
                              selectItemCubit.sidebarMiddleware.isEqual(
                                selectedWidget,
                                page,
                              )
                              ? selectColor
                              : iconColor ?? iconThemeData.color,
                        ),
                        child: icon,
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Expanded(
                        child: IconTheme(
                          data: IconThemeData(
                            size: iconSize ?? iconThemeData.size,
                            color:
                                selectItemCubit.sidebarMiddleware.isEqual(
                                  selectedWidget,
                                  page,
                                )
                                ? selectColor
                                : iconColor ?? iconThemeData.color,
                          ),
                          child: icon,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

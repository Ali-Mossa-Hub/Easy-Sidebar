import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../main_page_scops/main_page_scop.dart';
import '../../sidebar/sidebar_widget/sidebar.dart';
import '../../../util/enums/sidebar_animation.dart';
import '../../../animations/general_page_animation.dart';
import '../../../logic/slect_item/select_item_cubit.dart';

class MainPageItems extends StatelessWidget {
  final Curve curve;
  final Sidebar sidebar;
  final Duration mainPagesDuration;
  final SideBarAnimation mainPageAnimation;
  const MainPageItems({
    required this.curve,
    required this.sidebar,
    required this.mainPagesDuration,
    required this.mainPageAnimation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selectItemCubit = MainPageScop.of(context).selectItemCubit;
    return Row(
      children: [
        sidebar,
        Expanded(
          child: BlocSelector<SelectItemCubit, SelectItemState, Widget>(
            selector: selectItemCubit
                .sidebarMiddleware
                .returnBlocSelectorSelectItemState,
            builder: (context, page) => GeneralPageAnimation(
              page: page,
              curve: curve,
              nonAnimated: mainPageAnimation == SideBarAnimation.none,
              duration: mainPagesDuration,
              transitionBuilder: (child, animation) => selectItemCubit
                  .sidebarMiddleware
                  .getSideBarAnimation(child, animation, mainPageAnimation),
            ),
          ),
        ),
      ],
    );
  }
}

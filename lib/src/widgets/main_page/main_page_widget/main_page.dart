import 'package:easy_sidebar/src/core/get_it/get_it_files.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../main_page_scops/main_page_scop.dart';
import '../main_page_item_widget/main_page_items.dart';
import '../../sidebar/sidebar_widget/sidebar.dart';
import '../../sidebar/sidbar_item_widget/sidebar_item.dart';
import '../../../util/enums/sidebar_animation.dart';
import '../../../logic/change_sidebar_width/change_sidebar_width_cubit.dart';
import '../../../logic/slect_item/select_item_cubit.dart';

class MainPage extends StatefulWidget {
  final Curve curve;
  final Sidebar sidebar;
  final bool sideBarIsClosed;
  final Duration mainPagesDuration;
  final SideBarAnimation animation;

  const MainPage({
    required this.sidebar,
    this.curve = Curves.linear,
    this.sideBarIsClosed = false,
    this.mainPagesDuration = const Duration(milliseconds: 500),
    this.animation = SideBarAnimation.none,
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    GetItFiles.setUp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    final SidebarItem page = widget.sidebar.listSidebarItems.first;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SelectItemCubit()..changePage(page.page),
        ),
        BlocProvider(
          create: (context) => ChangeSidebarWidthCubit()
            ..changeSidebarWidth(
              widget.sideBarIsClosed
                  ? widget.sidebar.minWidth
                  : widget.sidebar.maxWidth,
              !widget.sideBarIsClosed,
            ),
        ),
      ],
      child: BlocBuilder<SelectItemCubit, SelectItemState>(
        buildWhen: (previous, current) => current is SelectItemInitial,
        builder: (context, state) => MainPageScop(
          duration: widget.mainPagesDuration,
          curve: widget.curve,
          selectItemCubit: context.read<SelectItemCubit>(),
          child: Scaffold(
            body: SizedBox(
              width: moreInfo.width,
              height: moreInfo.height,
              child: MainPageItems(
                curve: widget.curve,
                sidebar: widget.sidebar,
                mainPagesDuration: widget.mainPagesDuration,
                mainPageAnimation: widget.animation,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

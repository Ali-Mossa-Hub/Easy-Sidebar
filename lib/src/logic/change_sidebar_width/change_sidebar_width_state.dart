part of 'change_sidebar_width_cubit.dart';

@immutable
sealed class ChangeSidebarWidthState {}

final class ChangeSidebarWidthInitial extends ChangeSidebarWidthState {}

final class LoadingChangeSidebarState extends ChangeSidebarWidthState {}

// ignore: must_be_immutable
final class SuccessChangeSidebarState extends ChangeSidebarWidthState {
  final double sidebarWidth;
  bool isExpand = false;
  SuccessChangeSidebarState({
    required this.sidebarWidth,
    required this.isExpand,
  });
}

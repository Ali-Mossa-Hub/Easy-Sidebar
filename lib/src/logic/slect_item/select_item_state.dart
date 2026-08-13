part of 'select_item_cubit.dart';

@immutable
sealed class SelectItemState {
  const SelectItemState();
}

final class SelectItemInitial extends SelectItemState {
  const SelectItemInitial();
}

final class LoadingSelectItemState extends SelectItemState {
  const LoadingSelectItemState();
}

final class SuccessSelectItemState extends SelectItemState {
  final Widget page;
  const SuccessSelectItemState({required this.page});
}

final class FailedSelectItemState extends SelectItemState {}

final class LoadingRemovePageState extends SelectItemState {
  const LoadingRemovePageState();
}

final class SuccessRemovePageState extends SelectItemState {
  final Widget page;
  const SuccessRemovePageState({required this.page});
}

final class FailedRemovePageState extends SelectItemState {}

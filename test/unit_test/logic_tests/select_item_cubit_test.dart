import 'package:bloc_test/bloc_test.dart';
import 'package:easy_sidebar/src/logic/slect_item/select_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SelectItemCubit selectItemCubit;
  group('SelectItemCubit test', () {
    test('SelectItemCubit initialization', () {
      selectItemCubit = SelectItemCubit();
      expect(selectItemCubit.state, isA<SelectItemInitial>());
    });

    blocTest<SelectItemCubit, SelectItemState>(
      'emits SuccessSelectItemState when new page added.',
      build: () => SelectItemCubit(),
      act: (bloc) => bloc.changePage(const SizedBox()),
      expect: () => [
        isA<LoadingSelectItemState>(),
        isA<SuccessSelectItemState>(),
      ],
    );

    blocTest<SelectItemCubit, SelectItemState>(
      'emits SuccessRemovePageState when new page removed.',
      build: () {
        final bloc = SelectItemCubit();
        bloc.changePage(const SizedBox());
        bloc.changePage(const SizedBox());
        return bloc;
      },
      act: (bloc) => bloc.removeCurrentPage(),
      expect: () => [
        isA<LoadingRemovePageState>(),
        isA<SuccessRemovePageState>(),
      ],
    );
    blocTest<SelectItemCubit, SelectItemState>(
      'emits FailedRemovePageState when new page removed.',
      build: () => SelectItemCubit(),
      act: (bloc) => bloc.removeCurrentPage(),
      expect: () => [
        isA<LoadingRemovePageState>(),
        isA<FailedRemovePageState>(),
      ],
    );
  });
}

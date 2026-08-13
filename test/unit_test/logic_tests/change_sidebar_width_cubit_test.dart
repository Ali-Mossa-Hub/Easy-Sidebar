import 'package:bloc_test/bloc_test.dart';
import 'package:easy_sidebar/src/logic/change_sidebar_width/change_sidebar_width_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ChangeSidebarWidthCubit changeSidebarWidthCubit;
  group('ChangeSidebarWidthCubit tests', () {
    test('ChangeSidebarWidthCubit initialization', () {
      changeSidebarWidthCubit = ChangeSidebarWidthCubit();
      expect(changeSidebarWidthCubit.state, isA<ChangeSidebarWidthInitial>());
    });

    blocTest(
      'emits SuccessChangeSidebarState when sidebar width changes.',
      build: () => ChangeSidebarWidthCubit(),
      act: (bloc) => bloc.changeSidebarWidth(500, false),
      expect: () => [
        isA<LoadingChangeSidebarState>(),
        isA<SuccessChangeSidebarState>(),
      ],
    );
  });
}

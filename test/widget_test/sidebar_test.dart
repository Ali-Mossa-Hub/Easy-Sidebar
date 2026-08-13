import 'package:bloc_test/bloc_test.dart';
import 'package:easy_sidebar/easy_sidebar.dart';
import 'package:easy_sidebar/src/logic/change_sidebar_width/change_sidebar_width_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockChangeSidebarWidthCubit extends MockCubit<ChangeSidebarWidthState>
    implements ChangeSidebarWidthCubit {}

void main() {
  Future<void> pumbSidebarPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MainPage(
          sidebar: Sidebar(
            sidebarIconButton: SidebarIconButton(),
            listSidebarItems: [
              SidebarItem(icon: Icon(Icons.home), page: SizedBox()),
              SidebarItem(icon: Icon(Icons.person), page: SizedBox()),
              SidebarItem(icon: Icon(Icons.settings), page: SizedBox()),
              SidebarItem(icon: Icon(Icons.info), page: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }

  group('sidebar tests', () {
    testWidgets('sidebar icon tests', (tester) async {
      await pumbSidebarPage(tester);
      expect(find.byIcon(Icons.keyboard_arrow_left_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.keyboard_arrow_left_rounded));
      await tester.pump();
      expect(find.byIcon(Icons.keyboard_arrow_right_rounded), findsOneWidget);
    });

    testWidgets('sidebar width tests', (tester) async {
      await pumbSidebarPage(tester);
      expect(find.byIcon(Icons.keyboard_arrow_left_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.keyboard_arrow_left_rounded));

      await tester.pumpAndSettle();

      final size = tester.getSize(
        find.byKey(Key('animated_container_sidebar_widget_key')),
      );
      expect(size.width, 100);
    });
  });
}

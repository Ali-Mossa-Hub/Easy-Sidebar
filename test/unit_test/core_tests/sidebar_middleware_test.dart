import 'package:easy_sidebar/easy_sidebar.dart';
import 'package:easy_sidebar/src/core/middleware/sidebar_middleware.dart';
import 'package:easy_sidebar/src/logic/slect_item/select_item_cubit.dart';
import 'package:easy_sidebar/src/util/errors/page_error.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SidebarMiddleware tests', () {
    late SidebarMiddleware sidebarMiddleware;
    setUp(() {
      sidebarMiddleware = SidebarMiddleware();
    });
    group('isEqual function tests', () {
      test('isEqual returns true', () {
        //arrange
        final sizedBox = SizedBox();
        //act
        final isEqual = sidebarMiddleware.isEqual(sizedBox, sizedBox);
        //assets
        expect(isEqual, true);
      });
      test('isEqual returns false', () {
        //arrange
        //act
        final isEqual = sidebarMiddleware.isEqual(SizedBox(), SizedBox());
        //assets
        expect(isEqual, false);
      });
    });
    group('getCurrentPage functoin tests', () {
      test('getCurrentPage return widget', () {
        //arrange
        //act
        final sizedBoxWidget = SizedBox();
        sidebarMiddleware.moveToAnotherPage(sizedBoxWidget);
        final widget = sidebarMiddleware.getCurrentPage();
        //assert
        expect(widget, sizedBoxWidget);
      });
      test('getCurrentPage return error', () {
        //arrange
        //act
        //assert
        expect(
          () => sidebarMiddleware.getCurrentPage(),
          throwsA(isA<PageError>()),
        );
      });
    });

    group('getSideBarAnimation function tests', () {
      late final Animation<double> animation;
      late final Widget sizedBoxWidget;

      setUp(() {
        animation = const AlwaysStoppedAnimation<double>(1.0);
        sizedBoxWidget = SizedBox();
      });
      test('getSideBarAnimation with SideBarAnimation.none ', () {
        //arrage
        //act
        final widget = sidebarMiddleware.getSideBarAnimation(
          sizedBoxWidget,
          animation,
          SideBarAnimation.none,
        );
        //assert
        expect(widget, sizedBoxWidget);
      });
      test('getSideBarAnimation with SideBarAnimation.sized ', () {
        //arrage
        //act
        final widget = sidebarMiddleware.getSideBarAnimation(
          sizedBoxWidget,
          animation,
          SideBarAnimation.sized,
        );
        //assert
        expect(widget, isA<SizeTransition>());
      });
      test('getSideBarAnimation with SideBarAnimation.slide ', () {
        //arrage
        //act
        final widget = sidebarMiddleware.getSideBarAnimation(
          sizedBoxWidget,
          animation,
          SideBarAnimation.slide,
        );
        //assert
        expect(widget, isA<SlideTransition>());
      });
    });
    group('returnBlocSelectorSelectItemState function tests', () {
      late final Widget sizedBoxWidget;
      setUp(() {
        sizedBoxWidget = SizedBox();
      });
      test('return widget with SuccessSelectItemState', () {
        //arrage
        //act
        final widget = sidebarMiddleware.returnBlocSelectorSelectItemState(
          SuccessSelectItemState(page: sizedBoxWidget),
        );
        //assert
        expect(widget, sizedBoxWidget);
      });
      test('return widget with SuccessRemovePageState', () {
        //arrage
        //act
        final widget = sidebarMiddleware.returnBlocSelectorSelectItemState(
          SuccessRemovePageState(page: sizedBoxWidget),
        );
        //assert
        expect(widget, sizedBoxWidget);
      });

      test('return widget with FailedSelectItemState', () {
        //arrage
        //act
        final widget = sidebarMiddleware.returnBlocSelectorSelectItemState(
          FailedSelectItemState(),
        );
        //assert
        expect(widget, isA<SizedBox>());
      });
      test('return widget with FailedRemovePageState', () {
        //arrage
        //act
        final widget = sidebarMiddleware.returnBlocSelectorSelectItemState(
          FailedRemovePageState(),
        );
        //assert
        expect(widget, isA<SizedBox>());
      });
    });
  });
}

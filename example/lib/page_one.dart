import 'package:easy_sidebar/easy_sidebar.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  final util = HandlePages();
  PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        Text('home'),
        ElevatedButton(
          onPressed: () => util.pushPage(context, MyWidget()),
          child: Text('move'),
        ),
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  final util = HandlePages();
  MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .center,
      children: [
        Text('new page has been pushed'),
        IconButton(
          onPressed: () => util.popPage(context),
          icon: Icon(Icons.subdirectory_arrow_left_rounded),
        ),
      ],
    );
  }
}

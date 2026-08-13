import 'package:easy_sidebar/easy_sidebar.dart';
import 'package:flutter/material.dart';

class PageTow extends StatelessWidget {
  const PageTow({super.key});

  @override
  Widget build(BuildContext context) {
    final util = HandlePages();
    return Center(
      child: IconButton(
        onPressed: () => util.pushPage(
          context,
          Padding(padding: const EdgeInsets.all(8.0), child: Text('about us')),
        ),
        icon: Icon(Icons.move_down_rounded),
      ),
    );
  }
}

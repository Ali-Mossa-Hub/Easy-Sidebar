import 'package:easy_sidebar/easy_sidebar.dart';
import 'package:example/page_one.dart';
import 'package:example/page_tow.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPage(
      sideBarIsClosed: true,
      animation: SideBarAnimation.scale,
      curve: Curves.linear,
      mainPagesDuration: Duration(milliseconds: 350),
      sidebar: Sidebar(
        animation: SideBarAnimation.scale,
        minWidth: 50,
        topSidebar: Image.asset('assets/logo.png'),
        gradient: LinearGradient(colors: [Colors.blue, Colors.blueAccent]),
        sidebarIconButton: SidebarIconButton(),
        listSidebarItems: [
          SidebarItem(title: 'home', icon: Icon(Icons.home), page: PageOne()),
          SidebarItem(
            title: 'profile',
            icon: Icon(Icons.person),
            page: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('profile'),
            ),
          ),
          SidebarItem(title: 'about', icon: Icon(Icons.info), page: PageTow()),
          SidebarItem(
            title: 'settings',
            icon: Icon(Icons.settings),
            page: SizedBox(child: Text('setting')),
          ),
        ],
      ),
    );
  }
}

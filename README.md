
# Easy Sidebar

Turn your app’s navigation into a seamless experience with a beautiful, customizable sidebar

## 🎥 Demo

| Mobile | Desktop | Web |
| :---: | :---: | :---: |
| ![Mobile Demo](https://raw.githubusercontent.com/Ali-Mossa-Hub/Easy-Sidebar/main/assets/demos/mobile.gif) | ![Desktop Demo](https://raw.githubusercontent.com/Ali-Mossa-Hub/Easy-Sidebar/main/assets/demos/desktop.gif) | ![Web Demo](https://raw.githubusercontent.com/Ali-Mossa-Hub/Easy-Sidebar/main/assets/demos/web.gif) |

## Features

- Fully customizable sidebar widget
- Multiple animation styles
- No navigation package required
- Easy to use and maintain

## Install

In your Flutter project's pubspec.yaml file, add the following dependency:

```dart
dependencies:
  easy_sidebar: <latest_version>
```

## Getting started

In your Dart file, add the following import:

```dart
import 'package:easy_sidebar/easy_sidebar.dart';
```

## Usage

A basic example:

```dart
import 'package:flutter/material.dart';
import 'package:easy_sidebar/easy_sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPage(
      animation: SideBarAnimation.scale,
      curve: Curves.linear,
      mainPagesDuration: const Duration(milliseconds: 350),
      sidebar: Sidebar(
        minWidth: 50,
        maxWidth: 300,
        sidebarIconButton: SidebarIconButton(),
        backgroundColor: Colors.blueAccent,
        listSidebarItems: [
          SidebarItem(
            title: 'Home',
            icon: const Icon(Icons.home),
            page: const PageOne(),
          ),
        ],
      ),
    );
  }
}
```

### Animation

```dart
SideBarAnimation.none
SideBarAnimation.scale
SideBarAnimation.fade
SideBarAnimation.slide
SideBarAnimation.rotation
SideBarAnimation.sized
```

```dart
//the main page handles the sidebar widget and navigations
MainPage(
// Close the sidebar when the app starts
      sideBarIsClosed: true,
// Animation type for main page navigation
      animation: SideBarAnimation.scale,
// Curve type for the animation
      curve: Curves.linear,
// Duration of page navigation
      mainPagesDuration: Duration(milliseconds: 350),
// The sidebar widget.
      sidebar: Sidebar(
        //...
      )
);
```

### Sidebar widget

```dart
Sidebar(
// Sidebar collapse duration
        sideBarDuration: Duration(milliseconds: 320),
// The collapsed width
        minWidth: 50,
// The expanded width
        maxWidth: 300,
// Sidebar collapse animation curve
        sideBarItemCurve: Curves.bounceIn,
// Sidebar item animation
        animation: SideBarAnimation.scale,
// Duration of the sidebar item selection animation
        sideBarItemDuration: Duration(milliseconds: 320),
// Sidebar background color
        backgroundColor: Colors.blueAccent,
// Sidebar gradient (use either gradient or backgroundColor, not both)
        gradient: LinearGradient(colors: [Colors.blue, Colors.blueAccent]),
// Sidebar border radius
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(20),
          topEnd: Radius.circular(20),
        ),
// Sidebar margin
        sidebarMargin: EdgeInsetsDirectional.all(10),
// List of sidebar items
        listSidebarItems:[
            //...
        ] 
// Expand/collapse button
        sidebarIconButton: SidebarIconButton(),
// Widget displayed at the top of the sidebar
        topSidebar: Image.asset('assets/logo.png'),

);
```

### SidebarItem

```dart
SidebarItem(
    title: 'home',
    icon: Icon(Icons.home),
// The page to navigate to when the item is pressed
    page: PageOne(),
// Sidebar item border radius
    borderRadius: 30,
// Sidebar item hover colorside bar item hover color
    hoverColor: Colors.black.withAlpha(40),
    iconColor: Colors.black,
    iconSize: 20,
    itemMargin: EdgeInsetsDirectional.symmetric(
        vertical: 10,
        horizontal: 5,
    ),
    itemPadding: EdgeInsetsDirectional.symmetric(
        vertical: 10,
        horizontal: 8,
    ),
//Sidebar item selected background color
    selectBackgroundColor: Colors.black12,
//Sidebar item selected color (text and icon)
    selectColor: Colors.white,
    textStyle: TextStyle(
        //...
    ),
);
```

### SidebarIconButton

```dart
SidebarIconButton(
// collapsed widget
    collapseIcon: Icon(Icons.keyboard_arrow_left_rounded),
// expanded widget
    expandIcon: Icon(Icons.keyboard_arrow_right_rounded),
);
```

## Navigation

- You should use the navigation function provided by the package if you want the sidebar widget to remain visible while navigating between pages
- You should also use this function only with pages that are contained within the MainPage() widget

```dart
import 'package:easy_sidebar/easy_sidebar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final util = HandlePages();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => util.pushPage(context, SecondPage()),
          child: Text('move'),
        ),
      ],
    );
  }
}
/// the SecondPage 

class SecondPage extends StatelessWidget {
  final util = HandlePages();
  SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () => util.popPage(context),
          icon: Icon(Icons.subdirectory_arrow_left_rounded),
        ),
      ],
    );
  }
}

```

## Why Easy Sidebar?

- 🎨 Highly customizable sidebar
- ✨ Multiple animation styles
- 🚀 Simple API
- 🧩 No navigation package required
- ⚡ Lightweight and easy to integrate
  
## Requirements

- sdk: `^3.11.0`
- flutter: `>=1.17.0`

## License

This package is licensed under the BSD 3-Clause License.

See the LICENSE file for details

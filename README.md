
# Easy Sidebar

Turn your app’s navigation into a seamless experience with a beautiful, customizable sidebar

## Demo

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

In the pubspec.yaml of your flutter project, add the following dependency:

```dart
dependencies:
  easy_sidebar: <latest_version>
```

## Getting started

In your library file add this import:

```dart
import 'package:easy_sidebar/easy_sidebar.dart';
```

start using the package.

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
//the main page handle sidebar widget and navigations
MainPage(
// close the side bar in the begining of the app
      sideBarIsClosed: true,
// animation type of main pages navigations
      animation: SideBarAnimation.scale,
// curve type of animation
      curve: Curves.linear,
// duration of pages navigations
      mainPagesDuration: Duration(milliseconds: 350),
// the side bar widget
      sidebar: Sidebar(
        //...
      )
);
```

### Sidebar widget

```dart
Sidebar(
// side bar collaps duration
        sideBarDuration: Duration(milliseconds: 320),
// the collapsing width
        minWidth: 50,
// the expanding width
        maxWidth: 300,
// side bar collaps animatoin curve style
        sideBarItemCurve: Curves.bounceIn,
// the side bar item animation
        animation: SideBarAnimation.scale,
// selecting side bar item duration
        sideBarItemDuration: Duration(milliseconds: 320),
// side bar widget background
        backgroundColor: Colors.blueAccent,
// side bar widget gradiant (should only use either the gradient or the backgroundColor)
        gradient: LinearGradient(colors: [Colors.blue, Colors.blueAccent]),
// side bar widget borders raduis
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(20),
          topEnd: Radius.circular(20),
        ),
// the side bar widget margin
        sidebarMargin: EdgeInsetsDirectional.all(10),
// list of side bar items
        listSidebarItems:[
            //...
        ] 
// expanding-collapsing button
        sidebarIconButton: SidebarIconButton(),
// the top side of the side bar widget
        topSidebar: Image.asset('assets/logo.png'),

);
```

### SidebarItem

```dart
SidebarItem(
    title: 'home',
    icon: Icon(Icons.home),
// the page we want to navigate to it on pressing
    page: PageOne(),
// side bar item border raduis
    borderRadius: 30,
// side bar item hover color
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
//side bar item selecting background color
    selectBackgroundColor: Colors.black12,
//side bar item selecting color (text and icon)
    selectColor: Colors.white,
    textStyle: TextStyle(
        //...
    ),
);
```

### SidebarIconButton

```dart
SidebarIconButton(
// collapsing widget
    collapseIcon: Icon(Icons.keyboard_arrow_left_rounded),
// expanding widget
    expandIcon: Icon(Icons.keyboard_arrow_right_rounded),
);
```

## Navigation

- you should use the navigation function that package provides if you want the side bar widget
still appear if you navigate between pages
- also you should this function only with pages comes under MainPage() widget

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
  
```markdown
## Requirements

- sdk: `^3.11.0`
- flutter: `>=1.17.0`
- flutter_bloc: `^9.1.1`
- get_it: `^9.2.1`

## License

This package is licensed under the BSD 3-Clause License.

See the [LICENSE](LICENSE) file for details

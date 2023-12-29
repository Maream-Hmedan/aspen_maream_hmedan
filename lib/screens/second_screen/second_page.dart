import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'home/home_page.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int index = 0;

  final List<BottomModel> _bottom = [
    BottomModel(
        icon: const Icon(Icons.indeterminate_check_box),
        view: const HomePage()),
    BottomModel(
        icon: const Icon(Icons.confirmation_number_outlined),
        view: Container()),
    BottomModel(
        icon: const Icon(Icons.favorite_outline_rounded), view: Container()),
    BottomModel(icon: const Icon(Icons.person_outline), view: Container()),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _persistentTabBar(),
      ),
    );
  }

  Widget _persistentTabBar() {
    return PersistentTabView(
      context,
      screens: _bottom.map((e) => e.view).toList(),
      navBarHeight: 90,
      decoration:  const NavBarDecoration (
        borderRadius:  BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32)),
        gradient:  LinearGradient (
          colors:  <Color>[Color(0xfffdfdfd), Color(0xfff5f5f5)],
          stops:  <double>[0, 1],
        ),
        boxShadow:  [
          BoxShadow(
            color:  Color(0x0c186ff2),
            offset:  Offset(15, -19),
            blurRadius:  22,
          ),
        ],
      ),

      confineInSafeArea: true,
      navBarStyle: NavBarStyle.style6,
      items: [
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.indeterminate_check_box),
            activeColorPrimary:
                index == 0 ? const Color(0xff186FF2) : const Color(0xffB8B8B8)),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.confirmation_number_outlined),
            activeColorPrimary:
                index == 1 ? const Color(0xff186FF2) : const Color(0xffB8B8B8)),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.favorite_outline_rounded),
            activeColorPrimary:
                index == 2 ? const Color(0xff186FF2) : const Color(0xffB8B8B8)),
        PersistentBottomNavBarItem(
            icon: const Icon(Icons.person_outline),
            activeColorPrimary:
                index == 3 ? const Color(0xff186FF2) : const Color(0xffB8B8B8)),
      ],
      popActionScreens: PopActionScreensType.all,
      popAllScreensOnTapOfSelectedTab: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      onItemSelected: (value) {
        index = value;
        if (mounted) setState(() {});
      },
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapAnyTabs: false,
    );
  }
}

class BottomModel {
  Icon icon;
  Widget view;

  BottomModel({required this.icon, required this.view});
}

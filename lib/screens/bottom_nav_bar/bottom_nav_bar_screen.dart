import 'package:aspen_project/configuration/app_images.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../explore/explore_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int index = 0;

  final List<BottomTabModel> _bottomTabs = [
    BottomTabModel(
        icon: Image.asset(ticketBottomNavBar),
        view: const ExploreScreen()),
    BottomTabModel(
        icon:  Image.asset(ticketBottomNavBar),
        view: Container()),
    BottomTabModel(
        icon: Image.asset(heartBottomNavBar), view: Container()),
    BottomTabModel(icon: Image.asset(
        profileBottomNavBar), view: Container()),
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
      screens: _bottomTabs.map((e) => e.view).toList(),
      navBarHeight: 90,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)),
        gradient: LinearGradient(
          colors: <Color>[Color(0xfffdfdfd), Color(0xfff5f5f5)],
          stops: <double>[0, 1],
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x0c186ff2),
            offset: Offset(15, -19),
            blurRadius: 22,
          ),
        ],
      ),
      confineInSafeArea: true,
      navBarStyle: NavBarStyle.style6,
      items: [
        PersistentBottomNavBarItem(
          icon: Image.asset(homeBottomNavBar,scale: 0.7,
              color: index == 0
                  ? null
                  : const Color(0xffB8B8B8)),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(ticketBottomNavBar,scale: 0.7,
              color: index == 1
                  ? const Color(0xff186FF2)
                  : const Color(0xffB8B8B8)),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(heartBottomNavBar,scale: 0.7,
              color: index == 2
                  ? const Color(0xff186FF2)
                  : const Color(0xffB8B8B8)),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(
            profileBottomNavBar,scale: 0.7,
            color:
                index == 3 ? const Color(0xff186FF2) : const Color(0xffB8B8B8),
          ),
        ),
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

class BottomTabModel {
  Widget icon;
  Widget view;

  BottomTabModel({required this.icon, required this.view});
}

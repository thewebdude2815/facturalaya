import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pos_ui/constants/appConstants.dart';
import 'package:pos_ui/screens/dashboard.dart';
import 'package:pos_ui/screens/pos.dart';
import 'package:pos_ui/screens/products.dart';
import 'package:pos_ui/screens/profile.dart';
import 'package:pos_ui/utils/drawer.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  bool isOpened = false;

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  int index = 0;
  List<Widget> screens = [
    const Dashboard(),
    const POS(),
    const Products(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _endSideMenuKey,
      inverse: true, // end side menu
      background: Colors.green[700],
      type: SideMenuType.slideNRotate,
      menu: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: buildMenu(),
      ),
      onChange: (_isOpened) {
        setState(() => isOpened = _isOpened);
      },
      child: SideMenu(
        key: _sideMenuKey,
        menu: buildMenu(),
        type: SideMenuType.slideNRotate,
        onChange: (_isOpened) {
          setState(() => isOpened = _isOpened);
        },
        child: IgnorePointer(
          ignoring: isOpened,
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                            onTap: () => toggleMenu(),
                            child: SvgPicture.asset(
                              'assets/menu.svg',
                              height: 24,
                            ),
                          )),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            flex: 3,
                            child: Image.asset(
                              'images/logo.png',
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                              child: CircleAvatar(
                            radius: 20,
                            backgroundColor:
                                const Color.fromARGB(129, 152, 248, 227),
                            child: SvgPicture.asset(
                              'assets/human.svg',
                              height: 30,
                            ),
                          )),
                        ],
                      ),
                    ),
                    screens[index]
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              child: GNav(
                  selectedIndex: index,
                  onTabChange: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  rippleColor:
                      Colors.grey[800]!, // tab button ripple color when pressed
                  hoverColor: Colors.grey[700]!, // tab button hover color
                  haptic: true, // haptic feedback
                  tabBorderRadius: 25,
                  curve: Curves.easeOutExpo, // tab animation curves
                  duration: const Duration(
                      milliseconds: 900), // tab animation duration
                  gap: 8, // the tab button gap between icon and text
                  color: Colors.grey[800], // unselected icon color
                  activeColor: Colors.white, // selected icon and text color
                  iconSize: 24, // tab button icon size
                  tabBackgroundColor:
                      tealAppColor, // selected tab background color

                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10), // navigation bar padding
                  tabs: [
                    GButton(
                      icon: Icons.show_chart,
                      // icon: SvgPicture.asset(''),
                      // leading: SvgPicture.asset('assets/marcket.svg'),
                      text: 'Home',
                      iconColor: tealAppColor,
                    ),
                    GButton(
                      icon: Icons.percent,
                      text: 'POS',
                      iconColor: tealAppColor,
                    ),
                    GButton(
                      icon: Icons.shopping_bag,
                      text: 'Products',
                      iconColor: tealAppColor,
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'Profile',
                      iconColor: tealAppColor,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

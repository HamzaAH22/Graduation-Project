import 'package:faz3a_application/utils/app_colors.dart';
import 'package:faz3a_application/views/contact_us.dart';
import 'package:faz3a_application/views/customer/home_page.dart';
import 'package:faz3a_application/views/worker/requests_worker.dart';
import 'package:faz3a_application/views/worker/worker_orders.dart';
import 'package:faz3a_application/views/worker/worker_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';


class WorkerBottomNavigationBar extends StatefulWidget {
  static late BuildContext context;

  const WorkerBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<WorkerBottomNavigationBar> createState() => _WorkerBottomNavigationBarState();
}

class _WorkerBottomNavigationBarState extends State<WorkerBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    WorkerBottomNavigationBar.context=context;
    PersistentTabController _controller;
    List<Widget> _buildScreens() {
      return const [RequestsHomePage(),WorkerOrders() ,ContactUsPage(), WorkerProfilePage()];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.arrow_right_arrow_left),
          title: "Requsts",
          activeColorPrimary: AppColors().primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.arrow_swap),
          title: "Orders",
          activeColorPrimary: AppColors().primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.phone_circle),
          title: "Contact us",
          activeColorPrimary: AppColors().primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.profile_circled),
          title: "Profile",
          activeColorPrimary: AppColors().primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    _controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}

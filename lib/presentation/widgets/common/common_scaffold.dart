import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yozil/core/core.dart';
import 'package:yozil/presentation/presentation.dart';

part 'common_app_bar.dart';

class CommonScaffold extends StatefulWidget {
  const CommonScaffold({
    super.key,
    required this.navBarItem,
    this.childWidget,
    this.childWidgetTitle,
  });

  final Widget? childWidget;
  final String? childWidgetTitle;
  final NavBarItem navBarItem;

  @override
  State<CommonScaffold> createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageIndex = getCurrentIndex(context, widget.navBarItem);
  }

  int getCurrentIndex(BuildContext context, NavBarItem item) {
    switch (item) {
      case NavBarItem.home:
        return 0;
      case NavBarItem.explore:
        return 1;
      case NavBarItem.appointments:
        return 2;
      case NavBarItem.profile:
        return 3;
    }
  }

  void _handleNavigation(int value) {
    setState(() {
      pageIndex = value;
    });

    String path;
    switch (value) {
      case 0:
        path = ScreenPath.home;
        break;
      case 1:
        path = ScreenPath.explore;
        break;
      case 2:
        path = ScreenPath.appointments;
        break;
      case 3:
        path = ScreenPath.profile;
        break;
      default:
        return;
    }

    context.go(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: CommonAppBar(
        pageTitle: widget.childWidgetTitle ?? '',
      ),
      body: widget.childWidget,
      bottomNavigationBar:
          //custom nav bar
          CustomBottomBar(
        currentIndex: pageIndex,
        onTap: _handleNavigation,
      ),
      //salomon bar

      //     SalomonBottomBar(
      //   //curve: Curves.easeInOutCubicEmphasized,
      //   currentIndex: pageIndex,
      //   onTap: _handleNavigation,
      //   items: [
      //     SalomonBottomBarItem(
      //       icon: const Icon(Ionicons.fast_food_outline),
      //       activeIcon: const Icon(Ionicons.fast_food),
      //       title: const Text(""),
      //     ),
      //     SalomonBottomBarItem(
      //       icon: const Icon(IconlyBroken.bag),
      //       activeIcon: const Icon(IconlyBold.bag),
      //       title: const Text(""),
      //     ),
      //     SalomonBottomBarItem(
      //       icon: const Icon(IconlyBroken.document),
      //       activeIcon: const Icon(IconlyBold.document),
      //       title: const Text(""),
      //     ),
      //     SalomonBottomBarItem(
      //       icon: const Icon(IconlyBroken.profile),
      //       activeIcon: const Icon(IconlyBold.profile),
      //       title: const Text(""),
      //     ),
      //   ],
      // ),

      //curved navigation bar
      //     CurvedNavigationBar(
      //   backgroundColor: Colors.white,
      //   index: pageIndex,
      //   onTap: _handleNavigation,
      //   height: 75,
      //   items: const [
      //     Icon(Ionicons.fast_food_outline),
      //     Icon(IconlyBroken.bag),
      //     Icon(IconlyBroken.document),
      //     Icon(IconlyBroken.profile),
      //   ],
      // )

      //previous navigation bar
      // NavigationBar(
      //   selectedIndex: pageIndex,
      //   onDestinationSelected: _handleNavigation,
      //   destinations: const [
      //     NavigationDestination(
      //       icon: Icon(
      //         Ionicons.fast_food_outline,
      //       ),
      //       selectedIcon: Icon(Ionicons.fast_food),
      //       //label: 'Home',
      //       label: '',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(IconlyBroken.bag),
      //       selectedIcon: Icon(IconlyBold.bag),
      //       label: '',
      //       //label: 'Cart',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(IconlyBroken.document),
      //       selectedIcon: Icon(IconlyBold.document),
      //       label: '',
      //       //label: 'Order History',
      //     ),
      //     NavigationDestination(
      //       icon: Icon(IconlyBroken.profile),
      //       selectedIcon: Icon(IconlyBold.profile),
      //       label: '',
      //       //label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }
}

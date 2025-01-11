import 'package:flutter/material.dart';
import 'package:yozil/shared/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      navBarItem: NavBarItem.home,
      childWidgetTitle: 'Home',
    );
  }
}

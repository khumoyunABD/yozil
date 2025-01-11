import 'package:flutter/material.dart';
import 'package:yozil/shared/shared.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      navBarItem: NavBarItem.explore,
      childWidgetTitle: 'Explore',
    );
  }
}

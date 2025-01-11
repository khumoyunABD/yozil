import 'package:flutter/material.dart';
import 'package:yozil/shared/shared.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      navBarItem: NavBarItem.profile,
      childWidgetTitle: 'Profile',
    );
  }
}

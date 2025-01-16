import 'package:flutter/material.dart';
import 'package:yozil/presentation/presentation.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      navBarItem: NavBarItem.appointments,
      childWidgetTitle: 'Appointments',
    );
  }
}

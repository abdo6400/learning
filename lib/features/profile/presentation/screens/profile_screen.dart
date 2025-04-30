import 'package:flutter/material.dart';

import '../components/settings_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SettingsMenu(),
      ],
    );
  }
}

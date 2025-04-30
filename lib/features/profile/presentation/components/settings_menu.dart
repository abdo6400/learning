import 'package:flutter/material.dart';

import 'setting_item.dart' show SettingsItem;

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SettingsItem(
        title: 'Profile',
        icon: const Icon(Icons.person),
        onTap: () {},
      ),
      SettingsItem(
        title: 'My Courses',
        icon: const Icon(Icons.book),
      )
    ]);
  }
}

import 'package:flutter/material.dart';
import 'app.dart';
import 'config/locators/global_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalLocator.init();
  runApp(
    App(),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smoquit/ui/pages/splash/splash_view.dart';
import 'package:smoquit/ui/shared/app_colors.dart';

import 'app/locator.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "Main Navigator");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await setUpLocator();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SmoQuit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: kcPrimaryColor,
          primary: kcPrimaryColor,
        ),
        useMaterial3: false,
      ),
      home: const SplashView(),
    );
  }
}

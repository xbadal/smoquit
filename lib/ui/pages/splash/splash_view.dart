import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:smoquit/constant/app_strings.dart';
import 'package:smoquit/ui/pages/splash/splash_controller.dart';
import 'package:smoquit/ui/shared/app_colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (homeTabController) {
          return Scaffold(
            backgroundColor: kcWhiteColor,
            body: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 250,
                  ),
                ],
              ),
            ),
          );
        });
  }
}

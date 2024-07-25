import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smoquit/ui/pages/home/home_view.dart';

import '../../shared/app_colors.dart';
import '../../shared/dimens.dart';
import '../../shared/text_styles.dart';
import 'main_controller.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kcAppBarColor,
            title: Text(
              'SmoQuit',
              style: textStylePoppins(fontWeight: FontWeight.w600, fontSize: font_18, color: Colors.white),
            ),
          ),
          body: Obx(() => _getPage(controller.pageIndex.value)),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: "Search",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "Home",
                    ),
                  ],
                  currentIndex: controller.pageIndex.value,
                  selectedItemColor: Colors.green,
                  unselectedItemColor: Colors.white,
                  type: BottomNavigationBarType.values.first,
                  backgroundColor: kcPrimaryColor,
                  iconSize: 40,
                  onTap: controller.onPageIndexChanged,
                  elevation: 5)),
        );
      },
      init: MainController(),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      default:
        return HomeView();
    }
  }
}

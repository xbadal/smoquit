import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smoquit/ui/pages/home/home_controller.dart';
import 'package:smoquit/ui/shared/dimens.dart';
import 'package:smoquit/ui/shared/text_styles.dart';
import 'package:smoquit/ui/shared/ui_helper.dart';

import '../../shared/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              verticalSpaceTiny,
              Text(
                'Time without cigarette',
                style: textStylePoppins(color: Colors.red, fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              verticalSpaceTiny,
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: kcAppBarColor,
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Obx(() => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  controller.year.value,
                                  style: textStylePoppins(
                                      color: Colors.white, fontSize: font_40, fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Year',
                                  style: textStylePoppins(
                                      color: Colors.white, fontSize: font_16, fontWeight: FontWeight.w600),
                                ),
                              ],
                            )),
                      ),
                      Expanded(
                        child: Obx(() => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  controller.month.value,
                                  style: textStylePoppins(
                                      color: Colors.white, fontSize: font_40, fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Month',
                                  style: textStylePoppins(
                                      color: Colors.white, fontSize: font_16, fontWeight: FontWeight.w600),
                                ),
                              ],
                            )),
                      ),
                      Expanded(
                        child: Obx(() => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  controller.day.value,
                                  style: textStylePoppins(
                                      color: Colors.white, fontSize: font_40, fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Day',
                                  style: textStylePoppins(
                                      color: Colors.white, fontSize: font_16, fontWeight: FontWeight.w600),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
              verticalSpaceSmall,
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: kcAppBarColor,
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Obx(() => Text(
                            controller.stopWatchTime.value,
                            style:
                                textStylePoppins(color: Colors.white, fontSize: font_40, fontWeight: FontWeight.w600),
                          )),
                    ],
                  ),
                ),
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Not Smoked',
                        style: textStylePoppins(color: Colors.red, fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      verticalSpaceTiny,
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 150,
                          decoration: const BoxDecoration(
                            color: kcAppBarColor,
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Obx(() => Text(
                                controller.moneySaved.value,
                                style: textStylePoppins(
                                    color: Colors.white, fontSize: font_40, fontWeight: FontWeight.w600),
                              )),
                        ),
                      ),
                    ],
                  )),
                  horizontalSpaceSmall,
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Money Saved',
                          style: textStylePoppins(color: Colors.red, fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                        verticalSpaceTiny,
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height: 150,
                            decoration: const BoxDecoration(
                              color: kcAppBarColor,
                              borderRadius: BorderRadius.all(Radius.circular(16.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Obx(() => Text(
                                      controller.moneySaved.value,
                                      style: textStylePoppins(
                                          color: Colors.white, fontSize: font_40, fontWeight: FontWeight.w600),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      init: HomeController(),
    );
  }
}

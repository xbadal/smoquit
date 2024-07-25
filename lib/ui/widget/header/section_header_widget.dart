import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/app_colors.dart';
import '../../shared/text_styles.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(top: 8.0,bottom: 8.0),
      color: kcAccentColor,
      child: Text(
        title,
        style: textStylePoppins(fontSize: 14.0, fontWeight: FontWeight.w400, color: kcWhiteColor),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../shared/app_colors.dart';
import '../shared/dimens.dart';
import '../shared/text_styles.dart';

class UnderlineHeaderTextWidget extends StatelessWidget {
  const UnderlineHeaderTextWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title.toUpperCase(),
          style: textStylePoppins(fontSize: font_16),
        ),
        Container(
          height: 2,
          width: 50,
          margin: const EdgeInsets.only(bottom: 4, top: 4),
          color: kcLitePurpleColor,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smoquit/ui/shared/app_colors.dart';
import 'package:smoquit/ui/shared/text_styles.dart';

import '../../shared/ui_helper.dart';
import '../buttons/app_button.dart';
import '../buttons/outline_button.dart';

class ConfirmationDialog extends StatelessWidget {
  final Function onPositiveButtonClicked;
  final Function onNegativeButtonClicked;
  final String title;
  final String subTitle;
  final String positiveButtonLabel;
  final String negativeButtonLabel;
  final String assetImage;

  ConfirmationDialog({
    Key? key,
    required this.onPositiveButtonClicked,
    required this.onNegativeButtonClicked,
    required this.title,
    required this.subTitle,
    this.assetImage = '',
    required this.positiveButtonLabel,
    required this.negativeButtonLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      backgroundColor: Colors.white,
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (assetImage.isNotEmpty)
              Container(
                height: 130.0,
                margin: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'assets/images/expired.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: textStylePoppins(color: kcBlackColor, fontWeight: FontWeight.w700, fontSize: 18.0),
            ),
            verticalSpace(8.0),
            SizedBox(
              width: 200.0,
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                style: textStylePoppins(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                ),
              ),
            ),
            verticalSpace(24.0),
            Row(
              children: [
                Expanded(
                  child: OutlineBusyButton(
                    title: negativeButtonLabel,
                    height: 40,
                    onPressed: () {
                      Get.back();
                      onNegativeButtonClicked();
                    },
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: BusyButton(
                    height: 40,
                    title: positiveButtonLabel,
                    onPressed: () {
                      Get.back();
                      onPositiveButtonClicked();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}

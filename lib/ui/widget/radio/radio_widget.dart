import 'package:flutter/material.dart';
import 'package:smoquit/ui/shared/text_styles.dart';
import 'package:smoquit/ui/shared/ui_helper.dart';

class RadioWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isChecked;

  const RadioWidget({super.key, required this.title, required this.onTap, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          isChecked
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 24,
                )
              : const Icon(
                  Icons.circle_outlined,
                  color: Colors.green,
                  size: 24,
                ),
          horizontalSpaceSmall,
          Text(
            title,
            style: textStylePoppins(fontSize: 14),
          )
        ],
      ),
    );
  }
}

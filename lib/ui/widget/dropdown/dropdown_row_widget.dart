import 'package:flutter/material.dart';
import 'package:smoquit/ui/shared/text_styles.dart';

import '../../shared/ui_helper.dart';

class DropdownRowWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onSelected;

  const DropdownRowWidget({Key? key, required this.title, required this.isSelected, required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelected(),
      child: Container(
        height: 60.0,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        // decoration: BoxDecoration(
        //     color: offWhite,
        //     borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textStylePoppins(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0,
                ),
              ),
            ),
            horizontalSpaceTiny,
            isSelected
                ? const Icon(
                    Icons.radio_button_checked,
                    color: Colors.green,
                    size: 24.0,
                  )
                : const Icon(
                    Icons.radio_button_off,
                    color: Colors.blueGrey,
                    size: 24.0,
                  )
          ],
        ),
      ),
    );
  }
}

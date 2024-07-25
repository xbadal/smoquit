import 'package:flutter/material.dart';
import 'package:smoquit/ui/shared/app_colors.dart';
import 'package:smoquit/ui/shared/text_styles.dart';

import '../../shared/ui_helper.dart';

class DropdownHeadWidget extends StatelessWidget {
  final String title;
  final Icon leadingIcon;
  final Function onTap;

  DropdownHeadWidget({Key? key, required this.title, required this.leadingIcon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        elevation: 2.0,
        color: kcOffWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          height: 60.0,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          // decoration: BoxDecoration(
          //     color: offWhite,
          //     borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Row(
            children: [
              leadingIcon,
              horizontalSpaceTiny,
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textStylePoppins(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                  ),
                ),
              ),
              horizontalSpaceTiny,
              const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: Colors.blueGrey,
                size: 24.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

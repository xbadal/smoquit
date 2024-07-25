import 'package:flutter/material.dart';
import 'package:smoquit/ui/shared/app_colors.dart';
import 'package:smoquit/ui/shared/text_styles.dart';
import 'package:smoquit/ui/shared/ui_helper.dart';

class UnderlineTextFieldWidget extends StatelessWidget {
  UnderlineTextFieldWidget({
    super.key,
    this.hint,
    this.inputAction,
    this.inputType = TextInputType.text,
    this.error,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.maxLength = 50,
    this.controller,
    this.title,
  });

  final Function(String)? onChanged;
  final String? hint;
  final String? title;
  final TextInputAction? inputAction;
  final TextInputType inputType;
  final String? error;
  final bool obscureText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final int maxLength;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title ?? '',
                style: textStylePoppins(color: kcPrimaryColor, fontSize: 16.0, fontWeight: FontWeight.w400),
              ),
            ),
          TextFormField(
            controller: controller,
            keyboardType: inputType,
            textAlign: textAlign,
            textInputAction: inputAction,
            style: const TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w400),
            onChanged: onChanged,
            obscureText: obscureText,
            maxLength: maxLength,
            decoration: InputDecoration(
              prefixIcon: prefixIcon != null
                  ? Icon(
                      prefixIcon,
                      size: 18.0,
                      color: Colors.black,
                    )
                  : null,
              suffixIcon: suffixIcon != null ? suffixIcon : null,
              contentPadding: const EdgeInsets.all(12.0),
              border: BorderStyles.auctionTextFieldBorderStyle,
              enabledBorder: BorderStyles.auctionTextFieldBorderStyle,
              disabledBorder: BorderStyles.auctionTextFieldBorderStyle,
              focusedBorder: BorderStyles.enableTextFieldBorderStyle,
              errorText: error,
              errorMaxLines: 3,
              errorBorder: BorderStyles.errorBorder,
              errorStyle: textStylePoppins(color: Colors.red),
              hintStyle: textStylePoppins(color: Colors.grey),
              filled: true,
              hintText: hint,
              counterText: "",
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class BorderStyles {
  BorderStyles();

  static const UnderlineInputBorder textFieldBorderStyle = UnderlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    borderSide: BorderSide(
      color: Colors.grey,
      width: 1.0,
    ),
  );
  static const UnderlineInputBorder enableTextFieldBorderStyle = UnderlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    borderSide: BorderSide(
      color: kcPrimaryColor,
      width: 1.0,
    ),
  );
  static const UnderlineInputBorder auctionTextFieldBorderStyle = UnderlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    borderSide: BorderSide(
      color: Colors.grey,
      width: 1.0,
    ),
  );

  static const UnderlineInputBorder errorBorder = UnderlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    borderSide: BorderSide(
      color: Colors.red,
      width: 1,
    ),
  );
}

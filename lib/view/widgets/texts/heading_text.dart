import 'package:flutter/material.dart';
import 'package:royex_task/utils/app_font_styles.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  const HeadingText({required this.text, this.textAlign, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: AppFontStyle.appBarHeadingStyle
    );
  }
}

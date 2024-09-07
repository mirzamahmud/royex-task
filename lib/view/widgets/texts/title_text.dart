import 'package:flutter/material.dart';
import 'package:royex_task/utils/app_font_styles.dart';

class TitleText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const TitleText({required this.text, this.textAlign = TextAlign.center, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: AppFontStyle.appbarTitleStyle
    );
  }
}

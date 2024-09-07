import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royex_task/utils/app_colors.dart';

class AppFontStyle{

  static TextStyle appBarHeadingStyle = GoogleFonts.roboto(
    color: AppColors.colorBlack,
    fontWeight: FontWeight.w700,
    fontSize: 24
  );

  static TextStyle appbarTitleStyle = GoogleFonts.roboto(
    color: AppColors.colorBlack,
    fontSize: 16,
    fontWeight: FontWeight.w700
  );
}
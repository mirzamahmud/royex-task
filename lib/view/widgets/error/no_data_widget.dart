import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royex_task/utils/app_colors.dart';
import 'package:royex_task/utils/app_images.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.noDataImage,
            height: 32, width: 32,
          ),
          const SizedBox(height: 12),
          Text(
            "No Data Found",
            style: GoogleFonts.roboto(
              color: AppColors.colorBlack,
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}

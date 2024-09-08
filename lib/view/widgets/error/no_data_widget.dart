import 'package:flutter/material.dart';

import 'package:royex_task/utils/app_colors.dart';
import 'package:royex_task/utils/app_constant_text.dart';
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
            height: 96, width: 96,
          ),
          const SizedBox(height: 12),
          const Text(
            AppConstantText.noDataText,
            style: TextStyle(
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

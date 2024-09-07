import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royex_task/utils/app_colors.dart';
import 'package:royex_task/view/widgets/texts/heading_text.dart';
import 'package:royex_task/view/widgets/texts/title_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width, height: Get.height,
      padding: const EdgeInsetsDirectional.only(start: 24, top: 40, bottom: 20, end: 24),
      decoration: BoxDecoration(
          color: AppColors.colorWhite,
          boxShadow: [
            BoxShadow(color: AppColors.colorBlack.withOpacity(0.1), offset: const Offset(-1, -1), blurRadius: 15, spreadRadius: 2)
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: TitleText(
              text: "Issues",
            )
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingText(text: "Issues List"),
              const SizedBox(height: 8),
              // search field
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Transform.rotate(
                      angle: pi / 2,
                      child: const Icon(Icons.search, size: 28, color: AppColors.colorMintLeaf),
                    ),
                    contentPadding: const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: AppColors.colorGrey, width: 1)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: AppColors.colorGrey, width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: AppColors.colorGrey, width: 1)
                    )
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

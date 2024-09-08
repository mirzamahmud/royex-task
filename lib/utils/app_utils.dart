import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:royex_task/utils/app_colors.dart';

class AppUtils{

  /// ------- this method is used for set system ui overlay style
  static systemUiOverlay(){
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.colorWhite,
        statusBarIconBrightness: Brightness.dark
      )
    );
  }

  /// ------- this method is used for showing success toast msg
  static successMessage({required String title, required String msg}){
    Get.snackbar(
        title,
        msg,
        colorText: AppColors.colorWhite,
        backgroundColor: AppColors.colorGreen,
        snackPosition: SnackPosition.BOTTOM
    );
  }

  /// ------- this method is used for showing error toast msg
  static errorMessage({required String title, required String msg}){
    Get.snackbar(
      title,
      msg,
      colorText: AppColors.colorWhite,
      backgroundColor: AppColors.colorRed,
      snackPosition: SnackPosition.BOTTOM
    );
  }
}
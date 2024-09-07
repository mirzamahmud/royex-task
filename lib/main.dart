import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:royex_task/core/di_service/dependency_injection.dart';
import 'package:royex_task/my_app.dart';
import 'package:royex_task/utils/app_colors.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.initDependency();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: AppColors.colorWhite,
      statusBarIconBrightness: Brightness.dark
    )
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}
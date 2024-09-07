import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royex_task/constants/global/app_constant.dart';
import 'package:royex_task/route/app_pages.dart';
import 'package:royex_task/route/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appName,
      defaultTransition: Transition.noTransition,
      initialRoute: AppPages.issueScreen,
      getPages: AppRoutes.routes,
    );
  }
}

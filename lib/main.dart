import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:royex_task/core/di_service/dependency_injection.dart';
import 'package:royex_task/my_app.dart';
import 'package:royex_task/utils/app_utils.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.initDependency(); // inject dependency
  AppUtils.systemUiOverlay(); // used for system overlay style
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]); // device orientation
  runApp(const MyApp());
}
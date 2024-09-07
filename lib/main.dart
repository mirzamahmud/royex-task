import 'package:flutter/material.dart';
import 'package:royex_task/core/di_service/dependency_injection.dart';
import 'package:royex_task/my_app.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.initDependency();
  runApp(const MyApp());
}
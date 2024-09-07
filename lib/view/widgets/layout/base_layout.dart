import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:royex_task/constants/global/device_size_constant.dart';

class BaseLayout extends StatelessWidget {
  final Widget? mobileLayout;
  final Widget? webLayout;
  const BaseLayout({this.mobileLayout, this.webLayout, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        if(constraint.maxWidth < mobileWidth && (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS)){
          return mobileLayout!;
        }else{
          return webLayout!;
        }
      }
    );
  }
}

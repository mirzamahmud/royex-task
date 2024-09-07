import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:royex_task/utils/app_colors.dart';

class DataLoaderWidget extends StatelessWidget {
  const DataLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitCircle(
        color: AppColors.colorMintLeaf,
        size: 56,
      ),
    );
  }
}

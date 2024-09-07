import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:royex_task/utils/app_colors.dart';

class PaginationLoaderWidget extends StatelessWidget {
  const PaginationLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 16),
      child: Center(
        child: SpinKitCircle(
          color: AppColors.colorMintLeaf,
          size: 56,
        ),
      ),
    );
  }
}

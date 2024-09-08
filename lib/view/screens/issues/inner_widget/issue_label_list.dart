import 'package:flutter/material.dart';

import 'package:royex_task/core/helper/color_helper.dart';
import 'package:royex_task/data/models/issues_model.dart';
import 'package:royex_task/utils/app_colors.dart';

class IssueLabelList extends StatelessWidget {
  final List<Labels> labelList;
  const IssueLabelList({required this.labelList, super.key});

  @override
  Widget build(BuildContext context) {
    return labelList.isEmpty ? const SizedBox() : Wrap(
      spacing: 8, runSpacing: 4,
      children: List.generate(labelList.length, (index) => Chip(
        padding: EdgeInsets.zero,
        labelPadding: const EdgeInsetsDirectional.symmetric(vertical: 2, horizontal: 12),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        backgroundColor: ColorHelper.convertColor(labelList[index].color.toString()),
        label: Text(
          labelList[index].name ?? "",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.colorWhite,
            fontWeight: FontWeight.w500,
            fontSize: 12
          ),
        ),
      )),
    );
  }
}

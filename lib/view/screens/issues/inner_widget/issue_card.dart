import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royex_task/core/helper/date_converter.dart';
import 'package:royex_task/core/helper/string_format_helper.dart';
import 'package:royex_task/data/models/issues_model.dart';
import 'package:royex_task/utils/app_colors.dart';
import 'package:royex_task/view/screens/issues/inner_widget/issue_label_list.dart';

class IssueCard extends StatelessWidget {
  final List<IssuesModel> issueList;
  final int index;
  const IssueCard({required this.issueList, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        margin: index == (issueList.length - 1) ? EdgeInsetsDirectional.zero : const EdgeInsetsDirectional.only(bottom: 12),
        padding: const EdgeInsetsDirectional.only(bottom: 12),
        decoration: BoxDecoration(
            color: AppColors.colorWhite,
            border: index == (issueList.length - 1) ? null : Border(
                bottom: BorderSide(color: AppColors.colorGrey.withOpacity(0.3), width: 2)
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        issueList[index].title ?? "",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto(
                          color: AppColors.colorBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 4),
                      HtmlWidget(
                        StringFormatHelper.htmlTagLimitNumberOfLines(issueList[index].body),
                        textStyle: TextStyle(
                          color: AppColors.colorAsh.withOpacity(0.6),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        DateConverter.formattedDate(issueList[index].createdAt ?? ""),
                        textAlign: TextAlign.right,
                        style: GoogleFonts.roboto(
                          color: AppColors.colorBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        issueList[index].user?.login ?? "",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.roboto(
                          color: AppColors.colorAsh.withOpacity(0.6),
                          fontWeight: FontWeight.w600,
                          fontSize: 12
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            IssueLabelList(labelList: issueList[index].labels ?? []),
          ],
        )
    );
  }
}

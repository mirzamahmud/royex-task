import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:royex_task/core/helper/date_converter.dart';
import 'package:royex_task/core/helper/string_format_helper.dart';
import 'package:royex_task/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:royex_task/view/screens/issues/controller/issues_controller.dart';
import 'package:royex_task/view/widgets/error/no_data_widget.dart';
import 'package:royex_task/view/widgets/loader/data_loader_widget.dart';

class IssuesScreen extends StatefulWidget {
  const IssuesScreen({super.key});

  @override
  State<IssuesScreen> createState() => _IssuesScreenState();
}

class _IssuesScreenState extends State<IssuesScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    final controller = Get.find<IssuesController>();
    controller.initialState();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    final controller = Get.find<IssuesController>();
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if (controller.hasNext()) {
        controller.loadPaginationData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: GetBuilder<IssuesController>(
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.colorWhite,
            appBar: PreferredSize(
              preferredSize: Size(Get.width, 162),
              child: Container(
                width: Get.width, height: Get.height,
                padding: const EdgeInsetsDirectional.only(start: 24, top: 40, bottom: 20, end: 24),
                decoration: BoxDecoration(
                  color: AppColors.colorWhite,
                  boxShadow: [
                    BoxShadow(color: AppColors.colorBlack.withOpacity(0.1), offset: const Offset(-1, -1), blurRadius: 15, spreadRadius: 2)
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Issues",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: AppColors.colorBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Issues List",
                          style: GoogleFonts.roboto(
                            color: AppColors.colorBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: 24
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Transform.rotate(
                              angle: pi / 2,
                              child: const Icon(Icons.search, size: 28, color: AppColors.colorMintLeaf),
                            ),
                            contentPadding: const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: const BorderSide(color: AppColors.colorGrey, width: 1)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: const BorderSide(color: AppColors.colorGrey, width: 1)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: const BorderSide(color: AppColors.colorGrey, width: 1)
                            )
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ),
            body: controller.isLoading ? const DataLoaderWidget()
                : controller.issueList.isEmpty ? const NoDataWidget()
                : SingleChildScrollView(
              controller: scrollController,
              physics: const  BouncingScrollPhysics(),
              padding: const EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 24),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(controller.issueList.length, (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: AppColors.colorWhite,
                          border: index == (controller.issueList.length - 1) ? null : Border(
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
                                            controller.issueList[index].title ?? "",
                                            style: GoogleFonts.roboto(
                                                color: AppColors.colorBlack,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          HtmlWidget(
                                            StringFormatHelper.htmlTagLimitNumberOfLines(controller.issueList[index].body),
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
                                            DateConverter.formattedDate(controller.issueList[index].createdAt ?? ""),
                                            style: GoogleFonts.roboto(
                                                color: AppColors.colorBlack,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            controller.issueList[index].user?.login ?? "",
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
                            )
                          ],
                        )
                      ),
                    ))
                  ),
                  controller.hasNext() ? const Padding(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 16),
                    child: Center(
                      child: SpinKitCircle(
                        color: AppColors.colorMintLeaf,
                        size: 56,
                      ),
                    ),
                  ) : const SizedBox()
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royex_task/utils/app_colors.dart';
import 'package:royex_task/view/screens/issues/controller/issues_controller.dart';
import 'package:royex_task/view/screens/issues/inner_widget/issue_card.dart';
import 'package:royex_task/view/widgets/app_bar/custom_app_bar.dart';
import 'package:royex_task/view/widgets/error/no_data_widget.dart';
import 'package:royex_task/view/widgets/loader/data_loader_widget.dart';
import 'package:royex_task/view/widgets/loader/pagination_loader_widget.dart';

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
              child: const CustomAppBar()
            ),
            body: controller.isLoading ? const DataLoaderWidget() : controller.issueList.isEmpty ? const NoDataWidget() : SingleChildScrollView(
              controller: scrollController,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()
              ),
              padding: const EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 24),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(controller.issueList.length, (index) => IssueCard(
                      issueList: controller.issueList,
                      index: index
                    ))
                  ),
                  controller.hasNext() ? const PaginationLoaderWidget() : const SizedBox()
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

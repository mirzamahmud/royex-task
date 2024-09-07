import 'package:get/get.dart';
import 'package:royex_task/route/app_pages.dart';
import 'package:royex_task/view/screens/issues/binding/issues_binding.dart';
import 'package:royex_task/view/screens/issues/issues_screen.dart';

class AppRoutes{

  static List<GetPage> routes = [
    GetPage(
      name: AppPages.issueScreen,
      page: () => const IssuesScreen(),
      binding: IssuesBinding()
    )
  ];
}
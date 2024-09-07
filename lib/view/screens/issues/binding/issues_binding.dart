import 'package:get/get.dart';
import 'package:royex_task/data/repos/issues_repo.dart';
import 'package:royex_task/view/screens/issues/controller/issues_controller.dart';

class IssuesBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => IssuesRepo(apiService: Get.find()));
    Get.lazyPut(() => IssuesController(repo: Get.find()));
  }
}
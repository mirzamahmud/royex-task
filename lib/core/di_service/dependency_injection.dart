import 'package:get/get.dart';
import 'package:royex_task/service/api_service.dart';

class DependencyInjection{

  static void initDependency(){
    Get.lazyPut(() => ApiService());
  }
}
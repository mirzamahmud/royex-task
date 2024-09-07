import 'package:get/get.dart';
import 'package:royex_task/data/repos/issues_repo.dart';

class IssuesController extends GetxController{
  final IssuesRepo repo;
  IssuesController({required this.repo});
}
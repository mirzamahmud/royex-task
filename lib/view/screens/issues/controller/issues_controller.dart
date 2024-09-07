import 'dart:convert';

import 'package:get/get.dart';
import 'package:royex_task/constants/api_service_constant/api_response_model.dart';
import 'package:royex_task/data/models/issues_model.dart';
import 'package:royex_task/data/repos/issues_repo.dart';

class IssuesController extends GetxController{
  final IssuesRepo repo;
  IssuesController({required this.repo});

  bool isLoading = false;
  List<IssuesModel> issueList = [];
  int currentPage = 0;
  int perPage = 20;
  bool isPagination = false;
  bool hasMoreData = true;

  initialState() async{
    isLoading = true;
    currentPage = 0;
    issueList.clear();
    update();

    await loadData();
    isLoading = false;
    update();
  }

  Future<void> loadData() async{
    currentPage = currentPage + 1;

    ApiResponseModel responseModel = await repo.getIssueList(perPage: perPage, page: currentPage);
    if(responseModel.statusCode == 200){
      List<dynamic> model = jsonDecode(responseModel.responseJson);
      if (model.isNotEmpty) {
        issueList.addAll(model.map((item) => IssuesModel.fromJson(item)).toList());
        hasMoreData = model.length == perPage;
      }else{
        hasMoreData = false;
      }
    } else if(responseModel.statusCode == 301){

    } else if(responseModel.statusCode == 404){

    } else if(responseModel.statusCode == 422){

    }else{

    }

    update();
  }

  Future<void> loadPaginationData() async {
    isPagination = true;
    update();

    await loadData();

    isPagination = false;
    update();
  }

  bool hasNext() {
    return hasMoreData && !isPagination && !isLoading;
  }
}
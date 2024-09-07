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

  Future<void> loadData() async{
    isLoading = true;
    update();
    issueList.clear();

    ApiResponseModel responseModel = await repo.getIssueList();
    if(responseModel.statusCode == 200){
      List<dynamic> model = jsonDecode(responseModel.responseJson);
      for(var item in model){
        issueList.add(IssuesModel.fromJson(item));
      }
    } else if(responseModel.statusCode == 301){

    } else if(responseModel.statusCode == 404){

    } else if(responseModel.statusCode == 422){

    }else{

    }

    isLoading = false;
    update();
  }
}
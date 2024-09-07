import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:royex_task/constants/api_service_constant/api_response_model.dart';
import 'package:royex_task/data/models/issues_model.dart';
import 'package:royex_task/data/repos/issues_repo.dart';

class IssuesController extends GetxController{
  final IssuesRepo repo;
  IssuesController({required this.repo});

  /// ---------- initialize some essential variables
  /// [isLoading] variable needs for track loading data
  /// [issueList] variable needs for store data which will come from API
  /// [currentPage] variable represents initial page
  /// [perPage] variable represents how many data will show according to per page
  /// [isPagination] variable needs for track pagination loader
  /// [hasMoreData] used to track for more data
  /// [isFilterLoading] used for loading when filter data
  /// [searchController] is used for modifying text field
  /// [input] used for store modifying text field data
  /// [selectedLabels] used for storing [input] data

  bool isLoading = false;
  List<IssuesModel> issueList = [];
  int currentPage = 0;
  int perPage = 20;
  bool isPagination = false;
  bool hasMoreData = true;
  bool isFilterLoading = false;
  TextEditingController searchController = TextEditingController();
  String input = "";
  List<String> selectedLabels = [];

  /// -------- this method represents initial state of IssueScreen
  initialState() async{
    isLoading = true;
    currentPage = 0;
    issueList.clear();
    update();

    await loadData();
    isLoading = false;
    update();
  }

  /// ----- this method is used for fetching data from the [IssuesRepo]
  Future<void> loadData() async{
    currentPage = currentPage + 1;

    ApiResponseModel responseModel = await repo.getIssueList(perPage: perPage, page: currentPage, labels: selectedLabels);
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

  /// ------- this method is used for paginating data
  Future<void> loadPaginationData() async {
    isPagination = true;
    update();

    await loadData();

    isPagination = false;
    update();
  }

  /// ------ this method is used for tracking next page for loading data after pagination
  bool hasNext() {
    return hasMoreData && !isPagination && !isLoading;
  }

  /// ------ this method is used for searching data by using labels
  Future<void> searchLabelData() async{
    isFilterLoading = true;
    currentPage = 0;
    issueList.clear();
    input = searchController.text.trim();
    selectedLabels = input.split(" ").map((element) => element.trim()).toList();
    update();

    await loadData();
    isFilterLoading = false;
    update();
  }
}
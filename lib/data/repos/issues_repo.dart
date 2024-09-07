import 'package:royex_task/constants/api_service_constant/api_request_method.dart';
import 'package:royex_task/constants/api_service_constant/api_response_model.dart';
import 'package:royex_task/constants/api_service_constant/api_urls.dart';
import 'package:royex_task/service/api_service.dart';

class IssuesRepo{
  final ApiService apiService;
  IssuesRepo({required this.apiService});

  Future<ApiResponseModel> getIssueList({required int perPage, required int page}) async{
    String url = "${ApiUrls.baseUrl}${ApiUrls.repositoryIssuesEndPoint}?per_page=$perPage&page=$page";
    print("-------------- request url: $url");

    ApiResponseModel responseModel = await apiService.requestToServer(
      requestUrl: url,
      requestMethod: ApiRequestMethod.getRequest
    );
    print("-------------- status code: ${responseModel.statusCode}");
    print("-------------- response body: ${responseModel.responseJson}");

    return responseModel;
  }
}
import 'package:royex_task/constants/api_service_constant/api_request_method.dart';
import 'package:royex_task/constants/api_service_constant/api_response_model.dart';
import 'package:royex_task/constants/api_service_constant/api_urls.dart';
import 'package:royex_task/service/api_service.dart';

class IssuesRepo{
  final ApiService apiService;
  IssuesRepo({required this.apiService});

  /// ------- this method is used for fetching data from the server
  Future<ApiResponseModel> getIssueList({required int perPage, required int page, List<String>? labels}) async{
    /// Convert the list of labels to a comma-separated string
    String labelsQuery = labels != null && labels.isNotEmpty ? labels.join(',') : "";

    String url = "${ApiUrls.baseUrl}${ApiUrls.repositoryIssuesEndPoint}?per_page=$perPage&page=$page&labels=$labelsQuery";

    ApiResponseModel responseModel = await apiService.requestToServer(
      requestUrl: url,
      requestMethod: ApiRequestMethod.getRequest
    );

    return responseModel;
  }
}
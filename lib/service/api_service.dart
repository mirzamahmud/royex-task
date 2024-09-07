import 'package:http/http.dart' as http;
import 'package:royex_task/constants/api_service_constant/api_request_method.dart';
import 'package:royex_task/constants/api_service_constant/api_response_model.dart';

class ApiService{
  ApiService();

  /// [requestUrl] -> you need to pass API's url here as [String]
  /// [requestMethod] -> it is also [String] type, you just need to pass your API's method
  /// [bodyParams] -> sets the body of the request. It can be a [String], a [List] or a [Map<String, String>].
  /// If it's a String, it's encoded using [encoding] and used as the body of the request. The content-type of the request will default to "text/plain".
  /// If [bodyParams] is a List, it's used as a list of bytes for the body of the request.
  /// If [bodyParams] is a Map, it's encoded as form fields using [encoding].
  /// The content-type of the request will be set to "application/x-www-form-urlencoded"; this cannot be overridden.
  /// [headers] -> it is [Map<String, String>] type, you need to pass headers because it helps you contain more information about the resource to be fetched, or about the client requesting the resource and
  /// also hold additional information about the response, like its location or about the server providing it.

  Future<ApiResponseModel> requestToServer({
    required String requestUrl,
    required ApiRequestMethod requestMethod,
    Object? bodyParams,
    Map<String, String>? headers,
  }) async {
    Uri url = Uri.parse(requestUrl);
    http.Response response;

    try {
      if (requestMethod == ApiRequestMethod.postRequest) {
        response =
        await http.post(url, body: bodyParams, headers: headers).timeout(
          const Duration(seconds: 10),
          onTimeout: () =>
              http.post(url, body: bodyParams, headers: headers),
        );
      } else if (requestMethod == ApiRequestMethod.deleteRequest) {
        response = await http
            .delete(url, body: bodyParams, headers: headers)
            .timeout(const Duration(seconds: 10),
            onTimeout: () =>
                http.delete(url, body: bodyParams, headers: headers));
      } else if (requestMethod == ApiRequestMethod.putRequest) {
        response = await http
            .put(url, body: bodyParams, headers: headers)
            .timeout(const Duration(seconds: 10),
            onTimeout: () =>
                http.put(url, body: bodyParams, headers: headers));
      } else if (requestMethod == ApiRequestMethod.patchRequest) {
        response = await http
            .patch(url, body: bodyParams, headers: headers)
            .timeout(const Duration(seconds: 10),
            onTimeout: () =>
                http.put(url, body: bodyParams, headers: headers));
      } else {
        response = await http.get(url, headers: headers).timeout(
            const Duration(seconds: 10),
            onTimeout: () => http.get(url, headers: headers));
      }
      if (response.statusCode == 200) {
        return ApiResponseModel(200, response.body);
      } else if (response.statusCode == 201) {
        return ApiResponseModel(201, response.body);
      } else if (response.statusCode == 204) {
        return ApiResponseModel(204, response.body);
      } else if (response.statusCode == 301) {
        return ApiResponseModel(301, response.body);
      } else if (response.statusCode == 400) {
        return ApiResponseModel(400, response.body);
      } else if (response.statusCode == 401) {
        return ApiResponseModel(401, response.body);
      } else if (response.statusCode == 403) {
        return ApiResponseModel(403, response.body);
      } else if (response.statusCode == 404) {
        return ApiResponseModel(404, response.body);
      } else if (response.statusCode == 422) {
        return ApiResponseModel(422, response.body);
      } else {
        return ApiResponseModel(500, response.body);
      }
    } catch (e) {
      return ApiResponseModel(500, "");
    }
  }
}
// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, unnecessary_new, unnecessary_string_interpolations, curly_braces_in_flow_control_structures, body_might_complete_normally_catch_error

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sports_app/core/model/response/request_response.dart';
import 'package:sports_app/core/services/local_storage.dart';
import 'package:sports_app/locator.dart';

class ApiServices {
  Future<Dio> launchDio() async {
    String? accessToken = locator<LocalStorageService>().accessToken;
    String? userID = locator<LocalStorageService>().userId;
    Dio dio = new Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    // dio.interceptors.add(
    //     DioCacheManager(CacheConfig(baseUrl: EndPoint.baseUrl)).interceptor);
    // dio.options.headers['Content-Type'] = 'application/json';
    print("userId => $userID");
    print("accessToken => $accessToken");
    dio.options.headers["content-type"] = 'application/x-www-form-urlencoded';
    // dio.options.headers["x-api-channel"] = 'fitnessgym-app';
    // dio.options.headers["x-request-id"] = '$userID';
    // dio.options.headers["id"] = '$userID';
    // dio.options.headers["userId"] = '$userID';
    // dio.options.headers["trainerId"] = '$userID';
    // dio.options.headers["Authorization"] = 'Bearer $accessToken';

    dio.options.followRedirects = false;
    dio.options.validateStatus = (s) {
      if (s != null)
        return s < 500;
      else
        return false;
    };
    return dio;
  }

  get({required String url, params}) async {
    Dio dio = await launchDio();
    final response = await dio.get('$url', queryParameters: params).catchError((
      e,
    ) {
      debugPrint('Unexpected Error');
    });
    if (response.statusCode == 200) {
      return RequestResponse(true, message: null, data: response.data);
    } else if (response.statusCode == 500) {
      return RequestResponse(false, message: "Server Error", data: null);
    } else if (response.statusCode == 401) {
      return RequestResponse(false, message: "unauthorized Error", data: null);
    } else {
      return RequestResponse(false, message: "Network error", data: null);
    }
  }

  post({required String url, data, params, isMeal}) async {
    Dio dio = await launchDio();
    var response;
    try {
      response = await dio
          .post('$url', data: data, queryParameters: params)
          .catchError((e) {
            debugPrint('Unexpected Error $e');
          });
      print("apis service => ${response.data["body"]}");
      if (response.statusCode == 200) {
        return RequestResponse(true, message: null, data: response.data);
      } else if (response.statusCode == 401) {
        return RequestResponse(
          false,
          message: response.data["error"],
          data: null,
        );
      } else if (response.statusCode == 500) {
        return RequestResponse(false, message: 'Server Error', data: null);
      } else {
        return RequestResponse(
          false,
          message: response.data["error"],
          data: null,
        );
      }
    } catch (e) {
      return RequestResponse(
        false,
        message: "An unexpected error occured, please try again.",
        data: null,
      );
    }
  }

  put({required String url, data}) async {
    print("put 1");
    Dio dio = await launchDio();
    print("put 2");
    final response = await dio.put('$url', data: data).catchError((e) {
      print("put 3");
      debugPrint('Unexpected Error');
    });
    print("response +++> ${response.data.toString()}");
    if (response.statusCode == 200) {
      print("put 4");
      return RequestResponse(true, message: null, data: response.data);
    } else if (response.statusCode == 500) {
      print("put 5");
      return RequestResponse(false, message: 'Server Error');
    } else {
      print("put 6");
      return RequestResponse(false, message: 'Network Error');
    }
  }

  delete({required String url, params}) async {
    print(" delete =>1");
    Dio dio = await launchDio();
    print(" delete =>2");
    try {
      final response = await dio
          .delete('$url', queryParameters: params)
          .catchError((e) {
            debugPrint('Unexpected Error');
            print(" delete =>3");
          });
      print(" delete =>4");
      if (response.statusCode == 200) {
        return RequestResponse(true, message: null, data: response.data);
      } else if (response.statusCode == 500) {
        return RequestResponse(false, message: 'Server Error');
      } else {
        return RequestResponse(false, message: 'Network Error');
      }
    } catch (e) {
      print(" delete =>5");
      print("response delete catch");
      return RequestResponse(false, message: 'Invalidate Token', data: null);
    }
  }
}

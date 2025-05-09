import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:innovahub_app/core/network/end_point.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//Dio Helper That's Connect and Talk to API.
 class DioHelper {
  static late Dio dio;

  //Here The Initialize of Dio and Start Connect to API Using baseUrl.

   static init() {
    dio = Dio(
      BaseOptions(
        //Here the URL of API.
        baseUrl: EndPoint.baseUrl,
        connectTimeout: const Duration(minutes: 4),
        receiveDataWhenStatusError: true,
        // receiveTimeout: null,

        //Here we Put The Headers Needed in The API.
        headers: {
          'content-Type': "application/json; charset=utf-8",
          'Accept': "*/*",
          "Access-Control-Allow-Origin": "*",
          "transfer-encoding": "chunked",
          "content-encoding": "gzip",
          "Access-Control-Allow-Methods": "GET,PUT,POST,DELETE,PATCH,OPTIONS",
          'lang': 'en'
        },
      ),
    )..interceptors.addAll([
        // InterceptorsWrapper(
        //   onRequest: (options, handle) async {
        //     // options.headers['Authorization'] =
        //     //     'Bearer ${CacheService.getDataString(key: 'token')}';
        //     return handle.next(options);
        //   },
        //   onError: (error, handle) {
        //     if (error.response!.data['message'] ==
        //             "You are not authenticated" &&
        //         error.response!.statusCode == 401) {
        //       CacheService.clearData();
        //       // Get.offAllNamed(PageName.LOG_IN);
        //     }
        //     return handle.next(error);
        //   },
        // ),

        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90),
      ]);
  }

  //This Function to call API and get Some Data based on url(End Points) and Headers needed in API to get the Specific Data.
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    String? token,
    Options? options,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${token ?? ''}',
    };
    // dio.options.headers = {
    //   'x-auth-token': token ?? '',
    //   'Content-Type': 'application/json',
    // };
    // return await dio.get(
    //   url,
    // );
    debugPrint("-------------End Point----------------");
    debugPrint(url);
    debugPrint("-------------End Point----------------");

    debugPrint("-------------Request Data----------------");
    debugPrint('data is $queryParameters');
    debugPrint("-------------Request Data----------------");
    debugPrint("-------------Request Data----------------");
    debugPrint('data is $token');
    debugPrint("-------------Request Data----------------");

    try {
      // dio.options.headers = {
      //   'Authorization': 'Bearer ${token ?? ''}',
      // };
      final Response response = await dio.get(
        url,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
        options: options,
      );
      debugPrint("-------------Response Data----------------");
      debugPrint('response is => ${response.data}');
      debugPrint("-------------Response Data----------------");
      return response;
    } on DioException catch (e) {
      debugPrint("-------------Error Data----------------");
      debugPrint('error is => ${e.response!.data}');
      debugPrint("-------------Error Data----------------");
      rethrow;
    }
  }

  //This Function that's Used To Post Data to API based on URL(End Points) and Headers.
  static Future<Response> postData({
    required String url,
    required var data,
    //bool files = false,
    String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    String? contentType,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${token ?? ''}',
    };
    debugPrint("-------------End Point----------------");
    debugPrint(url);
    debugPrint("-------------End Point----------------");

    debugPrint("-------------Request Data----------------");
    debugPrint('data is $data');
    debugPrint("-------------Request Data----------------");
    debugPrint("-------------Request Data----------------");
    debugPrint('data is $token');
    debugPrint("-------------Request Data----------------");
    try {
      final Response response = await dio.post(
        url,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      debugPrint("-------------Response Data----------------");
      debugPrint('response is => ${response.data}');
      debugPrint("-------------Response Data----------------");
      return response;
    } on DioException catch (e) {
      debugPrint("-------------Error Data------------------");
      debugPrint('error is ${e.response!.data}');
      debugPrint("-------------Error Data------------------");
      rethrow;
    }
  }

  // dio.options.headers = {
  //   'Authorization': 'Bearer ${token ?? ''}',
  // };
  // return await dio.post(url, data: data).then((value) {
  //   return value;
  // }).catchError((onError) {
  //   if (onError is DioError) {
  //     print('vaerrrr--------->');
  //     print(onError.response!.statusCode);
  //     showToast(
  //         message: onError.response!.data['message'].toString(),
  //         color: Colors.red);
  //   }
  // });

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
    //bool files = false,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      final Response response = await dio.put(
        url,
        data: data,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
    // dio.options.headers = {
    //   'x-auth-token': token ?? '',
    //   //'Content-Type': 'application/json',
    // };
    // return await dio.put(
    //   url,
    //   data: data,
    // );
  }

  //This Function That's Used to Update Some Date based on URL(End Points) and Send what's you need to Update as Map.
  static Future<Response> patchData({
    required String url,
    required Map<String, dynamic> data,
    required String token,
    bool files = false,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      // 'Authorization': token ,
      'Content-Type': 'application/json',
    };
    return await dio.patch(
      url,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? token,
    //String lang = 'en',
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer $token',
        // 'Authorization': token ,
        //'Content-Type': 'application/json',
      };
      final Response response = await dio.delete(
        url,
        queryParameters: queryParameters,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
    // dio.options.headers = {
    //   'x-auth-token': userToken,
    //   'Content-Type': 'application/json',
    // };
    // return await dio.delete(url, data: data ?? '').catchError((error) {
    //   print("DIO ERROR $error");
    // });
  }

  static Future<Response> downloadData({
    required String token,
    required String savePath,
    required String url,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      // 'Authorization': token ,
      'Content-Type': 'application/json',
    };
    return await dio.download(url, savePath);
  }
}
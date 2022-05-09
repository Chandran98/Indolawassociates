import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:dio/dio.dart';

import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class Nomad extends StatelessWidget {
  const Nomad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 250,
          ),
          Center(
            child: Container(
              child: Stack(
                // alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.only(top:8,bottom:20,right: 10,left:10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: 220,
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Richieasdfs",
                                      style: GoogleFonts.poppins(
                                          color: black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Civil lawyer",
                                      style: GoogleFonts.poppins(
                                          color: black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle),
                                  height: 30,
                                  width: 30,child: Icon(Icons.arrow_forward_ios_rounded,color: white,size: 15,),
                                ),
                              )
                            ])
                      ],
                    ),
                  ),
                  Positioned(
                    // top: -10,
                    // left: 60,
                    child: Container(
                      height: 130,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(100)),
                          // shape: BoxShape.circle,
                          // color: Colors.redAccent,
                          image: DecorationImage(
                              image:
                                  AssetImage("assets/images/Login_image.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ApiResponse {
  final Response response;
  final dynamic error;

  ApiResponse(this.response, this.error);

  ApiResponse.withError(Response errorValue)
      : response = errorValue,
        error = errorValue;

  ApiResponse.withSuccess(Response responseValue)
      : response = responseValue,
        error = null;
}

class DioClient {
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;
  final SharedPreferences sharedPreferences;

  Dio dio;
  String token;

  DioClient({
    required this.token,
    required this.baseUrl,
    required this.dio,
    required this.loggingInterceptor,
    required this.sharedPreferences,
  });
  // {
  //   token = sharedPreferences.getString("AppConstants.TOKEN")!;
  //   print(token);
  //   dio = dioC;
  //   dio
  //     ..options.baseUrl = baseUrl
  //     ..options.connectTimeout = 30000
  //     ..options.receiveTimeout = 30000
  //     ..httpClientAdapter
  //     ..options.headers = {
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': 'Bearer $token'
  //     };
  //   dio.interceptors.add(loggingInterceptor);
  // }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }
}

class LoggingInterceptor extends InterceptorsWrapper {
  int maxCharactersPerLine = 200;

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print("--> ${options.method} ${options.path}");
    print("Headers: ${options.headers.toString()}");
    print("<-- END HTTP");

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    print(
        "<-- ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");

    String responseAsString = response.data.toString();

    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        print(
            responseAsString.substring(i * maxCharactersPerLine, endingIndex));
      }
    } else {
      print(response.data);
    }

    print("<-- END HTTP");

    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    print(
        "ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    return super.onError(err, handler);
  }
}

class Productrepo {
  final DioClient dioClient;
  Productrepo({required this.dioClient});

  Future getlist() async {
    try {
      final response =
          await dioClient.get("https://gorest.co.in/public/v2/users");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print("error");
      return Text("error");
    }
  }
}

class Paltan {
  Paltan({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  int id;
  String name;
  String email;
  String gender;
  String status;

  factory Paltan.fromJson(Map<String, dynamic> json) => Paltan(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
      };
}

class Productlist extends ChangeNotifier {
  late final Productrepo productrepo;
  // Productlist({required this.productrepo});
  // List <Paltan> _paltan;
  // get paltan =>_paltan;
  late Paltan _paltansmania;
  get paltansmania => _paltansmania;

  getproductllist() async {
    ApiResponse apiResponse = await productrepo.getlist();

    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      _paltansmania = (Paltan.fromJson(apiResponse.response.data));
    } else {
      print("Error 404");
    }
  }
}

import 'dart:convert';
import 'package:app/core/utils/helper_methods.dart';
import 'package:dio/dio.dart';
import '../di/injector.dart';
import '../exceptions/api_exception.dart';
import '../routes/routes.dart';
import '../utils/navigator.dart';

class ClientCreator {
  final Interceptor? interceptor;

  ClientCreator({this.interceptor});

  Dio create() {
    final dio2 = Dio(); // Provide a dio instance
    // dio2.options.connectTimeout(Duration(seconds: 60).inMilliseconds));
    dio2.interceptors.add(LogInterceptor(responseBody: true));
    if (interceptor != null) {
      dio2.interceptors.add(interceptor!);
    }
    return dio2;
  }
}

class HeaderInterceptor extends Interceptor {
  final keyAuthorization = "Authorization";
  final keyLanguage = "Accept-Language";
  final keyCountry = "Accept-Country";
  final keyType = "Content-Type";
  final keyAccept = "Accept";
  final keyVersion = "version";

  final String accessToken;

  HeaderInterceptor({required this.accessToken});

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // String? token =   HelperMethods.getToken();
    // options.headers[keyAuthorization] = 'Bearer $token';
     options.headers[keyType] = 'application/json';
      options.headers[keyAccept] = 'application/json';
    // options.headers[keyLanguage] = injector<ServicesLocator>().languageCode;
    // options.headers[keyCountry] = 1;
    // options.headers[keyVersion] = '1.0.0';
    // // options.headers['platform'] = Platform.isAndroid ? 'Android' : 'IOS';
    //
    print('options.headers => ${options.headers}');
    print('options.queryParameters => ${options.queryParameters}');
    print('options.data => ${options.data}');

     super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(
        'DIO ERROR onError ${err.response != null} =>error message is  ${err.error}');

    if (err.response != null) {
      Map<String, dynamic> data = json.decode(err.response.toString());

      // final status = data.containsKey('status') ? data['status'] : 400;
      final message = data.containsKey('message') ? data['message'] : "Error";
      if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
         Navigators.pushReplacementNamed(Routes.loginPage);
      }
      throw ApiException(message, err.response?.statusCode ?? 400);
    } else {
      super.onError(err, handler);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    Map<String, dynamic> data = response.data;
    final message = data.containsKey('message') ? data['message'] : "Error";
    // final status = data.containsKey('status') ? data['status'] : "Error";
    String code =
        data.containsKey('code') ? response.data['code'].toString() : "E";
    print('onRespons ${response.toString()} => ${code != 'Ok'}');
    // if (status != SUCCESS_CODE) {
    //   throw ApiException(message, code);
    // }
  }
}

import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:async';

class ApiClient {
  static const String baseUrl = 'http://gank.io/api/';

  var dio = ApiClient.createDio();

  // 获取今日新闻
  Future<dynamic> getTodayNews() async {
    Response<Map> response = await dio.get('today');
    return response.data['results'];
  }

  // 获取散读
  Future<dynamic>   getGankReader({int count, int page}) async {
    Response<Map> response = await dio.get('xiandu/data/id/appinn/count/${count}/page/${page}', queryParameters: {"start":count, 'count':page});
    return response.data;
  }

  static Dio createDio() {
    var options = BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 10000,
        receiveTimeout: 100000,
        contentType: ContentType.json,
    );
    return Dio(options);
  }
}
class yuleApi {
  static const String baseUrl = 'http://v.juhe.cn/';

  var dio = yuleApi.createDio();

  // 获取新闻资讯
  Future<dynamic> getYuleList(String key, String type) async {
    Response<Map> response = await dio.get('toutiao/index' ,queryParameters: {"key":key, 'type':type});
    return response.data['result'];
  }

  static Dio createDio() {
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 100000,
      contentType: ContentType.json,
    );
    return Dio(options);
  }
}
class Yule360Api{
  static const String baseUrl = 'http://yule.360.cn/';

  var dio = Yule360Api.createDio();

  // 获取新闻资讯
  Future<dynamic> getYule360List(String size, String pn) async {
    Response<Map> response = await dio.get('feeds/getListAll' ,queryParameters: {"size":size, 'pn':pn});
    return response.data['data'];
  }

  static Dio createDio() {
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 100000,
      contentType: ContentType.json,
    );
    return Dio(options);
  }
}
class oneWord {
  static const String baseUrl = 'https://v1.hitokoto.cn';

  var dio = oneWord.createDio();

  // 获取新闻资讯
  Future<dynamic> getOneWord() async {
    Response<Map> response = await dio.get('/');
    return response.data;
  }

  static Dio createDio() {
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 100000,
      contentType: ContentType.json,
    );
    return Dio(options);
  }
}
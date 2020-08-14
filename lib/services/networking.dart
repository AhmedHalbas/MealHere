import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'dart:async';
import 'package:whattoeat/services/meal.dart';

class NetworkHelper {
  final String url;
  Response response;
  Dio dio = new Dio();
  List<Meal> list = [];

  NetworkHelper(this.url);

  Future<List<Meal>> getData() async {
    try {
      dio.interceptors
          .add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);
      response = await dio.get(
        url,
        options: buildCacheOptions(
          Duration(seconds: 30),
          maxStale: Duration(days: 6),
        ),
      );

      if (response.statusCode == 200) {
        var data = response.data;
        var rest = data['meals'] as List;
        list = rest.map<Meal>((json) => Meal.fromJson(json)).toList();
        return list;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

import 'package:dio/dio.dart';
import 'package:sintomed_app/src/utils/url.dart';
// import 'package:sintomedapp/services/shared_preferences_service.dart';

class APIService {
  static String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIwZjM0ZGIwLTIzMzItNDkxYS04ODdhLWUyZGE3YTcxOGViMiIsImlhdCI6MTU5MzA0MjMwMn0.KDmQxGtXX5VvWDCpxORFY3zCFKINsOwwfV-2F3vhBIs";
  static BaseOptions options =
      new BaseOptions(connectTimeout: 5000, receiveTimeout: 5000, headers: {
    'authorization': 'Bearer $token',
  });

  final Dio _dio = Dio(options);

  Future<Response> getSyntomsTypes() async {
    Response response = await _dio.get(Url.syntomsTypesUrl);
    return response;
  }

  Future<Response> getSyntomsGenerics() async {
    Response response = await _dio.get(Url.syntomsGenericsUrl);
    return response;
  }
}

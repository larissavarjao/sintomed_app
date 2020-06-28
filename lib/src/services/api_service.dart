import 'package:dio/dio.dart';
import 'package:sintomed_app/src/utils/url.dart';
// import 'package:sintomedapp/services/shared_preferences_service.dart';

class APIService {
  static String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZDdmNGQ2LTE2NmMtNDM5MC04N2IwLTc5Yzk0ZmY4MGNjYyIsImlhdCI6MTU5MzA5MDI3Nn0.HvPVo6znP8HWipZbpxjD6x2XDGzfr5kj4RAAJNwP_Zs";
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

  Future<Response> getSyntoms() async {
    Response response = await _dio.get(Url.syntomsUrl);
    return response;
  }

  Future<Response> registerUser(String email, String password, String firstName,
      String lastName, String pacientName) async {
    Response response = await _dio.post(Url.usersUrl, data: {
      'firstName': firstName,
      'lastName': lastName,
      'pacientName': pacientName,
      'email': email,
      'password': password,
    });
    return response;
  }

  Future<Response> loginUser(String email, String password) async {
    Response response = await _dio.post(Url.authUrl, data: {
      'email': email,
      'password': password,
    });
    return response;
  }
}

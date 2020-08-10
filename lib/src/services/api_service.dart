import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sintomed_app/src/services/shared_pref_service.dart';
import 'package:sintomed_app/src/stores/auth/auth_store.dart';
import 'package:sintomed_app/src/utils/url.dart';

class APIService {
  String token;
  static BaseOptions options =
      BaseOptions(connectTimeout: 5000, receiveTimeout: 5000);
  Dio _dio = Dio(options);

  _getRequestOptions() async {
    SharedPrefService prefs =
        SharedPrefService(SharedPreferences.getInstance());
    String token = await prefs.authToken;
    return RequestOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
        'authorization': 'Bearer $token',
      },
    );
  }

  Future logoutOnInvalidToken() async {
    _dio.interceptors.add(InterceptorsWrapper(onError: (DioError error) async {
      if (error.response.statusCode == 401) {
        AuthStore authStore = AuthStore();
        await authStore.logoutUserOnInvalidToken();
      }
    }));
  }

  Future<Response> getSymptomsTypes() async {
    await logoutOnInvalidToken();
    Response response = await _dio.get(
      Url.symptomsTypesUrl,
      options: await _getRequestOptions(),
    );
    return response;
  }

  Future<Response> getSymptomsGenerics() async {
    await logoutOnInvalidToken();
    Response response = await _dio.get(
      Url.symptomsGenericsUrl,
      options: await _getRequestOptions(),
    );
    return response;
  }

  Future<Response> getSymptoms() async {
    await logoutOnInvalidToken();
    Response response = await _dio.get(
      Url.symptomsUrl,
      options: await _getRequestOptions(),
    );
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
    _dio.interceptors.add(InterceptorsWrapper(onError: (DioError error) async {
      if (error.response.statusCode == 401) {
        AuthStore authStore = AuthStore();
        await authStore.logoutUserOnInvalidToken();
      }
    }));
    Response response = await _dio.post(Url.authUrl, data: {
      'email': email,
      'password': password,
    });
    return response;
  }
}

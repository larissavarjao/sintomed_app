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

  Future logoutOnInvalidToken() async {
    _dio.interceptors.add(InterceptorsWrapper(onError: (DioError error) async {
      if (error.response.statusCode == 401) {
        print('LOGIN ERRADO');
        AuthStore authStore = AuthStore();
        await authStore.logoutUserOnInvalidToken();
      }
    }));
  }

  Future<Response> getSymptomsTypes() async {
    await logoutOnInvalidToken();
    Response response = await _dio.get(Url.symptomsTypesUrl);
    return response;
  }

  Future<Response> getSymptomsGenerics() async {
    await logoutOnInvalidToken();
    Response response = await _dio.get(Url.symptomsGenericsUrl);
    return response;
  }

  Future<Response> getSymptoms() async {
    await logoutOnInvalidToken();
    SharedPrefService prefs =
        SharedPrefService(SharedPreferences.getInstance());
    String token = await prefs.authToken;
    Response response = await _dio.get(
      Url.symptomsUrl,
      options: RequestOptions(
        connectTimeout: 5000,
        receiveTimeout: 5000,
        headers: {
          'authorization': 'Bearer $token',
        },
      ),
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
        print('LOGIN ERRADO');
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

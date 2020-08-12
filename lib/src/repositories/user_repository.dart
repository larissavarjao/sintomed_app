import 'package:dio/dio.dart';
import 'package:sintomed_app/src/models/user_model.dart';
import 'package:sintomed_app/src/services/api_service.dart';

class UserRepository {
  Future<Response> registerUser(User user, String password) async {
    try {
      final Response response = await APIService().registerUser(user, password);
      return response;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      final Response response = await APIService().loginUser(email, password);
      Map<String, dynamic> data = response.data;
      return data;
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}

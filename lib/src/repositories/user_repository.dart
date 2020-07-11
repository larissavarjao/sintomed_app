import 'package:dio/dio.dart';
import 'package:sintomed_app/src/services/api_service.dart';

class UserRepository {
  Future<Response> registerUser(String email, String password, String firstName,
      String lastName, String pacientName) async {
    try {
      final Response response = await APIService()
          .registerUser(email, password, firstName, lastName, pacientName);
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      final Response response = await APIService().loginUser(email, password);
      Map<String, dynamic> data = response.data;
      return data;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

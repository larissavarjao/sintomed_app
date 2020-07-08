import 'package:dio/dio.dart';
import 'package:sintomed_app/src/models/symptom_model.dart';
import 'package:sintomed_app/src/services/api_service.dart';

class SymptomsRepository {
  List<Symptom> symptomsTypes;

  Future<List<Symptom>> loadData() async {
    try {
      final Response response = await APIService().getSymptoms();
      List<dynamic> data = response.data;
      List<Symptom> symptoms = data.map((d) => Symptom.fromJson(d)).toList();
      return symptoms;
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}

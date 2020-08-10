import 'package:dio/dio.dart';
import 'package:sintomed_app/src/models/symptom_generic_model.dart';
import 'package:sintomed_app/src/services/api_service.dart';

class SymptomsGenericsRepository {
  List<SymptomGeneric> symptomsGenerics;

  Future<List<SymptomGeneric>> loadData() async {
    try {
      final Response response = await APIService().getSymptomsGenerics();
      List<dynamic> data = response.data;
      List<SymptomGeneric> symptomsGenerics =
          data.map((d) => SymptomGeneric.fromJson(d)).toList();
      return symptomsGenerics;
    } catch (e) {
      rethrow;
    }
  }
}

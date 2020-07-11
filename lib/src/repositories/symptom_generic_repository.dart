import 'package:dio/dio.dart';
import 'package:sintomed_app/src/models/symptom_generic_model.dart';
import 'package:sintomed_app/src/services/api_service.dart';

class SymptomsGenericsRepository {
  List<SymptomGeneric> symptomsTypes;

  Future<List<SymptomGeneric>> loadData() async {
    try {
      final Response response = await APIService().getSymptomsTypes();
      List<dynamic> data = response.data;
      List<SymptomGeneric> symptomsTypes =
          data.map((d) => SymptomGeneric.fromJson(d)).toList();
      return symptomsTypes;
    } catch (e) {
      rethrow;
    }
  }
}

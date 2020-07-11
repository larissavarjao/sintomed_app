import 'package:dio/dio.dart';
import 'package:sintomed_app/src/models/symptom_type_model.dart';
import 'package:sintomed_app/src/services/api_service.dart';

class SymptomsTypesRepository {
  List<SymptomType> symptomsTypes;

  Future<List<SymptomType>> loadData() async {
    try {
      final Response response = await APIService().getSymptomsTypes();
      List<dynamic> data = response.data;
      List<SymptomType> symptomsTypes =
          data.map((d) => SymptomType.fromJson(d)).toList();
      return symptomsTypes;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

import 'package:dio/dio.dart';
import 'package:sintomed_app/src/models/symptom_model.dart';
import 'package:sintomed_app/src/repositories/index.dart';
import 'package:sintomed_app/src/services/api_service.dart';

class SymptomsRepository extends BaseRepository {
  List<Symptom> symptomsTypes;

  Future<List<Symptom>> loadData() async {
    try {
      final Response response = await APIService().getSymptoms();
      List<dynamic> data = response.data;
      List<Symptom> symptoms = data.map((d) => Symptom.fromJson(d)).toList();
      return symptoms;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<Symptom> createData(Symptom symptom) async {
    try {
      final Response response = await APIService().createSymptom(symptom);
      Map<String, dynamic> data = response.data;
      return Symptom.fromJson(data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<Symptom>> updateData() async {}

  Future<List<Symptom>> deleteData() async {}
}

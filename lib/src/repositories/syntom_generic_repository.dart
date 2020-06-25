import 'package:dio/dio.dart';
import 'package:sintomed_app/src/models/syntom_generic_model.dart';
import 'package:sintomed_app/src/services/api_service.dart';

class SyntomsGenericsRepository {
  List<SyntomGeneric> syntomsTypes;

  Future<List<SyntomGeneric>> loadData() async {
    try {
      final Response response = await APIService().getSyntomsTypes();
      List<dynamic> data = response.data;
      List<SyntomGeneric> syntomsTypes =
          data.map((d) => SyntomGeneric.fromJson(d)).toList();
      return syntomsTypes;
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}

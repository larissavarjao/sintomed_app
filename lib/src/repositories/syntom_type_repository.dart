import 'package:dio/dio.dart';
import 'package:sintomed_app/src/models/syntom_model.dart';
import 'package:sintomed_app/src/services/api_service.dart';

class SyntomsTypesRepository {
  List<SyntomType> syntomsTypes;

  Future<List<SyntomType>> loadData() async {
    try {
      final Response response = await APIService().getSyntomsTypes();
      List<dynamic> data = response.data;
      List<SyntomType> syntomsTypes =
          data.map((d) => SyntomType.fromJson(d)).toList();
      return syntomsTypes;
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}

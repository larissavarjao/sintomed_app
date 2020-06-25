import 'package:dio/dio.dart';
import 'package:sintomed_app/src/models/syntom_model.dart';
import 'package:sintomed_app/src/services/api_service.dart';

class SyntomsRepository {
  List<Syntom> syntomsTypes;

  Future<List<Syntom>> loadData() async {
    try {
      final Response response = await APIService().getSyntoms();
      List<dynamic> data = response.data;
      List<Syntom> syntoms = data.map((d) => Syntom.fromJson(d)).toList();
      return syntoms;
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}

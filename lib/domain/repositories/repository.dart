
import 'package:flutter_puertorico_mvvm/data/models/government_response.dart';
import 'package:flutter_puertorico_mvvm/data/models/municipality.dart';

abstract class Repository {
  Future<GovernmentResponse> getGovernmentData();
  Future<List<Municipality>> getMunicipalities();
}


import 'package:flutter_puertorico_mvvm/features/municipalities/data/models/municipality.dart';

abstract class MunicipalitiesRepository {
  Future<List<Municipality>> getMunicipalities();
}


import 'package:flutter_puertorico_mvvm/features/municipalities/data/models/municipality.dart';
import 'package:flutter_puertorico_mvvm/features/municipalities/domain/repositories/municipalities_repository.dart';

class GetMunicipalities {
  final MunicipalitiesRepository repository;

  GetMunicipalities(this.repository);

  Future<List<Municipality>> call() {
    return repository.getMunicipalities();
  }
}


import 'package:flutter_puertorico_mvvm/data/models/municipality.dart';
import 'package:flutter_puertorico_mvvm/domain/repositories/repository.dart';

class GetMunicipalities {
  final Repository repository;

  GetMunicipalities(this.repository);

  Future<List<Municipality>> call() {
    return repository.getMunicipalities();
  }
}


import 'package:flutter_puertorico_mvvm/data/models/government_response.dart';
import 'package:flutter_puertorico_mvvm/domain/repositories/repository.dart';

class GetGovernmentData {
  final Repository repository;

  GetGovernmentData(this.repository);

  Future<GovernmentResponse> call() {
    return repository.getGovernmentData();
  }
}

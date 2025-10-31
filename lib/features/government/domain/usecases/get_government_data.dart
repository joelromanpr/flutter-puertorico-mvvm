
import 'package:flutter_puertorico_mvvm/features/government/data/models/government_response.dart';

import '../repositories/government_repository.dart';

class GetGovernmentData {
  final GovernmentRepository repository;

  GetGovernmentData(this.repository);

  Future<GovernmentResponse> call() {
    return repository.getGovernmentData();
  }
}

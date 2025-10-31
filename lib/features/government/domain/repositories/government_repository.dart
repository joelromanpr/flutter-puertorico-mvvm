
import 'package:flutter_puertorico_mvvm/features/government/data/models/government_response.dart';

abstract class GovernmentRepository {
  Future<GovernmentResponse> getGovernmentData();
}

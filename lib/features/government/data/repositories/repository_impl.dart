
import 'package:flutter_puertorico_mvvm/core/data/datasources/api_service.dart';
import 'package:flutter_puertorico_mvvm/features/government/data/models/government_response.dart';
import 'package:flutter_puertorico_mvvm/features/government/domain/repositories/government_repository.dart';

class GovernmentRepositoryImpl implements GovernmentRepository {
  final ApiService _apiService;

  GovernmentRepositoryImpl(this._apiService);

  @override
  Future<GovernmentResponse> getGovernmentData() async {
    final data = await _apiService.getGovernmentData();
    return GovernmentResponse.fromJson(data);
  }
}


import 'package:flutter_puertorico_mvvm/data/datasources/api_service.dart';
import 'package:flutter_puertorico_mvvm/data/models/government_response.dart';
import 'package:flutter_puertorico_mvvm/data/models/municipality.dart';
import 'package:flutter_puertorico_mvvm/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  final ApiService _apiService;

  RepositoryImpl(this._apiService);

  @override
  Future<GovernmentResponse> getGovernmentData() async {
    final data = await _apiService.getGovernmentData();
    return GovernmentResponse.fromJson(data);
  }

  @override
  Future<List<Municipality>> getMunicipalities() async {
    final data = await _apiService.getMunicipalities();
    return data.map((json) => Municipality.fromJson(json)).toList();
  }
}

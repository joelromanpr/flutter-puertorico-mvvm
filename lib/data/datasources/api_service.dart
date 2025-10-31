
abstract class ApiService {
  Future<Map<String, dynamic>> getGovernmentData();
  Future<List<dynamic>> getMunicipalities();
}

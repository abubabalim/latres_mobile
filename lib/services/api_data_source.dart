import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadList(String endpoint) {
    return BaseNetwork.get("$endpoint?format=json");
  }
}
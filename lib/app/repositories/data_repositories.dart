import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import '../services/api.dart';
import '../services/api_service.dart';

class DataRepository {
  final APIService apiService;

  DataRepository({@required this.apiService});

  String _accessToken;

  Future<int> getEndpointData(Endpoint endpoint) async {
    try {
      if (_accessToken == null) {
        _accessToken = await apiService.getAccessToken();
      }
      return await apiService.getEndpointData(
        accesToken: _accessToken,
        endpoint: endpoint,
      );
    } on Response catch (response) {
      if (response.statusCode == 401) {
        _accessToken = await apiService.getAccessToken();
        return await apiService.getEndpointData(
          accesToken: _accessToken,
          endpoint: endpoint,
        );
      }
      {}
      rethrow;
    }
  }
}

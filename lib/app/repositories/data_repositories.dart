import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:rest_api_course/app/services/endpoint_data.dart';
import '../repositories/endpoints_data.dart';
import '../services/api.dart';
import '../services/api_service.dart';

class DataRepository {
  DataRepository({
    @required this.apiService,
  });

  final APIService apiService;

  String _accessToken;

  Future<EndpointData> getEndpointData(Endpoint endpoint) async =>
      await _getDataRefreshingToken<EndpointData>(
        onGetData: () => apiService.getEndpointData(
          accesToken: _accessToken,
          endpoint: endpoint,
        ),
      );

  Future<EndpointsData> getAllEndpointsData() async =>
      await _getDataRefreshingToken<EndpointsData>(
        onGetData: _getAllEndpointsData,
      );

  Future<T> _getDataRefreshingToken<T>({Future<T> Function() onGetData}) async {
    try {
      if (_accessToken == null) {
        _accessToken = await apiService.getAccessToken();
      }
      return await onGetData();
    } on Response catch (response) {
      if (response.statusCode == 401) {
        _accessToken = await apiService.getAccessToken();
        return await onGetData();
      }
      rethrow;
    }
  }

  Future<EndpointsData> _getAllEndpointsData() async {
    final values = await Future.wait([
      apiService.getEndpointData(
        accesToken: _accessToken,
        endpoint: Endpoint.cases,
      ),
      apiService.getEndpointData(
        accesToken: _accessToken,
        endpoint: Endpoint.casesConfirmed,
      ),
      apiService.getEndpointData(
        accesToken: _accessToken,
        endpoint: Endpoint.casesSuspected,
      ),
      apiService.getEndpointData(
        accesToken: _accessToken,
        endpoint: Endpoint.deaths,
      ),
      apiService.getEndpointData(
        accesToken: _accessToken,
        endpoint: Endpoint.recovered,
      ),
    ]);

    return EndpointsData(values: {
      Endpoint.cases: values[0],
      Endpoint.casesConfirmed: values[1],
      Endpoint.casesSuspected: values[2],
      Endpoint.deaths: values[3],
      Endpoint.recovered: values[4],
    });
  }
}

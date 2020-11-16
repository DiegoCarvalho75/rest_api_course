import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class APIService {
  final API api;

  APIService(this.api);

  Future<String> getAccessToken() async {
    final response = await http.post(
      api.tokenUri().toString(),
      headers: {
        'Authorization': 'Basic ${api.apiKey}',
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final accessToken = data['access_token'];
      if (accessToken != null) {
        return accessToken;
      }
    }
    print(
        '${api.tokenUri()} Failed >> StatusCode: ${response.statusCode} ${response.reasonPhrase} ');
    throw response;
  }

  Future<int> getEndpointData({
    @required String accesToken,
    @required Endpoint endpoint,
  }) async {
    final uri = api.endpointUri(endpoint);
    final response = await http.get(
      uri.toString(),
      headers: {'Autorization': 'Bearer $accesToken'},
    );
    if (response.statusCode == 200) {
      
      final List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        final Map<String, dynamic> endpointData = data[0];
        final String responseJsonKey = _responseJsonKeys[endpointData];
        final int result = endpointData[responseJsonKey];
        if (result != null) {
          return result;
        }
      }
    }
    print(
        'Request $uri failed\n Response >> ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }

  static Map<Endpoint, dynamic> _responseJsonKeys = {
    Endpoint.cases: "cases",
    Endpoint.casesConfirmed: "data",
    Endpoint.casesSuspect: "data",
    Endpoint.deaths: "data",
    Endpoint.recovered: "data",
  };
}

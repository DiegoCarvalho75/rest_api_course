import 'package:flutter/foundation.dart';

import './api_keys.dart';

enum Endpoint {
  cases,
  casesSuspected,
  casesConfirmed,
  deaths,
  recovered,
}

class API {
  API({@required this.apiKey});

  final String apiKey;

  factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxkey);

  static final String host = "ncov2019-admin.firebaseapp.com";

  Uri tokenUri() => Uri(
        scheme: 'https',
        host: host,
        path: 'token',
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        path: _path[endpoint],
      );

  static Map<Endpoint, String> _path = {
    Endpoint.cases: 'cases',
    Endpoint.casesConfirmed: 'casesConfirmed',
    Endpoint.casesSuspected: 'casesSuspected',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
  };
}

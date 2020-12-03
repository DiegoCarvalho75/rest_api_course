import 'package:flutter/foundation.dart';
import '../services/endpoint_data.dart';
import '../services/api.dart';

class EndpointsData {
  ///////////////////
  final Map<Endpoint, EndpointData> values;

  EndpointsData({@required this.values});

  EndpointData get cases => values[Endpoint.cases];
  EndpointData get casesConfirmed => values[Endpoint.casesConfirmed];
  EndpointData get casesSuspected => values[Endpoint.casesSuspected];
  EndpointData get deaths => values[Endpoint.deaths];
  EndpointData get recovered => values[Endpoint.recovered];

  @override
  String toString() => '''
    cases: $cases 
    confirmed $casesConfirmed 
    suspect: $casesSuspected  
    deaths $deaths
    recovered $recovered ''';
}

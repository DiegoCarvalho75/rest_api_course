import 'package:flutter/foundation.dart';
import '../services/api.dart';

class EndpointsData {
  ///////////////////
  final Map<Endpoint, int> values;

  EndpointsData({@required this.values});

  int get cases => values[Endpoint.cases];
  int get casesConfirmed => values[Endpoint.casesConfirmed];
  int get casesSuspected => values[Endpoint.casesSuspected];
  int get deaths => values[Endpoint.deaths];
  int get recovered => values[Endpoint.recovered];

  @override
  String toString() => '''
    cases: $cases 
    confirmed $casesConfirmed 
    suspect: $casesSuspected  
    deaths $deaths
    recovered $recovered ''';
}

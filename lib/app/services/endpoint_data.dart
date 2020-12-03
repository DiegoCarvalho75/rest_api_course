import 'package:flutter/foundation.dart';

class EndpointData {
  final int value;
  final DateTime date;
  EndpointData({this.value, this.date}) : assert(value != null);

  @override
  String toString() {
    return 'value: $value  date: $date';
  }
}

import 'package:flutter/material.dart';
import 'package:rest_api_course/app/services/api.dart';
import 'package:rest_api_course/app/ui/endpoint_card.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coronavirus Tracker Dashboard'),
      ),
      body: ListView(
        children: [
          EndpointCard(
            endpoint: Endpoint.cases,
            value: 50000,
          )
        ],
      ),
    );
  }
}

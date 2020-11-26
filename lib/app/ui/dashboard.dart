import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repositories/data_repositories.dart';
import '../services/api.dart';
import '../ui/endpoint_card.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _cases;
  @override
  void initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final cases = await dataRepository.getEndpointData(Endpoint.cases);
    setState(() {
      _cases = cases;
    });
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text('Coronavirus Tracker Dashboard'),
      ),
      body: RefreshIndicator(
        onRefresh: _updateData,
        child: ListView(
          children: [
            EndpointCard(
              endpoint: Endpoint.cases,
              value: _cases,
            )
          ],
        ),
      ),
    );
  }
}

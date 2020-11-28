import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repositories/endpoints_data.dart';
import '../repositories/data_repositories.dart';
import '../services/api.dart';
import '../ui/endpoint_card.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  EndpointsData _endpointsData;
  @override
  void initState() {
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final endpointsData = await dataRepository.getAllEndpointsData();
    setState(() {
      _endpointsData = endpointsData;
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
            for (var endpoint in Endpoint.values)
              EndpointCard(
                endpoint: endpoint,
                value: _endpointsData != null
                    ? _endpointsData.values[endpoint]
                    : null,
              )
          ],
        ),
      ),
    );
  }
}

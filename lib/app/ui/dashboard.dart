import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repositories/data_repositories.dart';
import '../repositories/endpoints_data.dart';
import '../services/api.dart';
import '../ui/endpoint_card.dart';
import '../ui/last_updated_status_text.dart';

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
    final formatter = LastUpdateDateFormatter(
        lastUpdate: _endpointsData != null
            ? _endpointsData.values[Endpoint.cases].date ?? ''
            : null);
    return Scaffold(
      appBar: AppBar(
        title: Text('Coronavirus Tracker Dashboard'),
      ),
      body: RefreshIndicator(
        strokeWidth: 4,
        color: Colors.orange,
        backgroundColor: Colors.deepPurple,
        onRefresh: _updateData,
        child: ListView(
          children: [
            for (var endpoint in Endpoint.values)
              EndpointCard(
                endpoint: endpoint,
                value: _endpointsData != null
                    ? _endpointsData.values[endpoint].value
                    : null,
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LastUpdatedStatusText(
                text: formatter.lastUpdteStatusText(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

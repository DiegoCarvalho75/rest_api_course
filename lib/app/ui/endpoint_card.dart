import 'package:flutter/material.dart';

import '../services/api.dart';

class EndpointCard extends StatelessWidget {
  const EndpointCard({
    Key key,
    this.endpoint,
    this.value,
  }) : super(key: key);

  final Endpoint endpoint;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          children: [
            Text(
              "Casos",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              value?.toString() ?? '',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
    );
  }
}

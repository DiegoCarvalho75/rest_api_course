import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LastUpdateDateFormatter {
  final DateTime lastUpdate;
  LastUpdateDateFormatter({
    this.lastUpdate,
  });
  String lastUpdteStatusText() {
    if (lastUpdate != null) {
      final formatter = DateFormat.yMd().add_jm();
      final formatted = formatter.format(lastUpdate);
      return 'Last Updated: $formatted';
    }
    return '';
  }
}

class LastUpdatedStatusText extends StatelessWidget {
  final String text;
  const LastUpdatedStatusText({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}

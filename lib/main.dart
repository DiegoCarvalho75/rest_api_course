// import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'app/repositories/data_repositories.dart';
import 'app/services/api.dart';
import 'app/services/api_service.dart';
import 'app/ui/dashboard.dart';

void main() async {
  String locale = Intl.defaultLocale = 'pt_BR';
  await initializeDateFormatting();
  runApp(MyApp());
  // doWhenWindowReady(() {
  //   var initialSize = Size(300, 670);
  //   appWindow.minSize = initialSize;
  //   appWindow.size = initialSize;
  //   appWindow.alignment = Alignment.topRight;
  //   appWindow.show();
  // });
}

class MyApp extends StatelessWidget {
  /// [ Home ]

  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(
        apiService: APIService(API.sandbox()),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coronavirus Tracker',
        theme: ThemeData.dark().copyWith(
          cardTheme: CardTheme(
            elevation: 10,
          ),
          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: Colors.deepPurple,
            textTheme: TextTheme(
              title: TextStyle(
                color: Colors.yellow[600],
                letterSpacing: 0.07,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          scaffoldBackgroundColor: Color(0xFF17204D),
          cardColor: Color(0xFF060A35),
        ),
        home: Dashboard(),
      ),
    );
  }
}

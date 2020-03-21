import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/routes/router.dart';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //

    return MaterialApp(
      initialRoute: ApplevelConstants.homeRoute,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
      onUnknownRoute: (settings) => MaterialPageRoute<dynamic>(
        builder: (context) => UndefinedView(name: settings.name),
      ),
      title: ApplevelConstants.titleOnTab,
    );
  }
}

import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/routes/router.dart' as route;
import 'package:experiments_with_web/app_level/styles/themes.dart';
import 'package:experiments_with_web/locator.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_level/services/hive/hive_helpers.dart';
import 'globals.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // INIT DEP INJECTION..
  /// ¯_(ツ)_/¯
  setupLocator();

  // HIVE SECTION
  await Hive.initFlutter();
  HiveHelpers.registerAdapters();

  // Open Fav Box
  await HiveHelpers.openFavoritesBox();

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
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.Router.generateRoute,
      onUnknownRoute: (settings) => MaterialPageRoute<dynamic>(
        builder: (context) => route.UndefinedView(name: settings.name),
      ),
      initialRoute: ApplevelConstants.homeRoute,
      navigatorObservers: [AppGlobals.routeObserver],
      theme: AppTheme.lightTheme,
      title: ApplevelConstants.titleOnTab,
    );
  }
}

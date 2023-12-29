import 'package:flutter/material.dart';
import 'package:search_grid/Routes/routes.locator.dart';
import 'package:search_grid/constants/strings.dart';
import 'package:stacked_services/stacked_services.dart';
import 'Routes/routes.router.dart';
import 'constants/colors.dart';

void main() async {
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: kScaffoldBackgroundColor,
      theme: ThemeData(fontFamily: kFontFamily),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: Routes.splashView,

    );
  }
}

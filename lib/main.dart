import 'package:common_bottom_nav/bottom_navigation/bottom_screen.dart';
import 'package:common_bottom_nav/route_helper.dart';
import 'package:flutter/material.dart';

final navigationKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: RouteHelper.createRoutes(),
      initialRoute: BottomScreenView.route,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medo/emergency.dart';
import 'package:medo/emergency_state.dart';
import 'package:medo/informs_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        InformsTab.routeName: (_) => InformsTab(),
        EmergencyTab.routeName: (_) => EmergencyTab(),
        EmergencyState.routeName: (_) => EmergencyState(),
      },
      initialRoute: EmergencyState.routeName,
    );
  }
}

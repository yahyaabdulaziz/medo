import 'package:flutter/material.dart';
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
      routes: {InformsTab.routrName: (_) => InformsTab()},
      initialRoute: InformsTab.routrName,
    );
  }
}

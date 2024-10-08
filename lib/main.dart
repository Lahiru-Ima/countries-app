import 'package:flutter/material.dart';
import 'features/country/country_list_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.teal.shade100)),
      home: const CountryListScreen(),
    );
  }
}

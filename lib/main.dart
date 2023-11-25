import 'package:flutter/material.dart';
import 'package:flutter_navigation_app/screens/data_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const DataScreen(),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.group), label: 'Data'),
            NavigationDestination(
                icon: Icon(Icons.contact_page), label: 'Contact'),
          ],
        ),
      ),
    );
  }
}

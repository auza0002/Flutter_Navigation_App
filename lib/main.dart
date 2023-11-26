import 'package:flutter/material.dart';
import 'package:flutter_navigation_app/screens/contact_screen.dart';
import 'package:flutter_navigation_app/screens/data_screen.dart';
import 'package:flutter_navigation_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pagesIndex = 0;

  List<Widget> pages = const [HomeScreen(), DataScreen(), ContactScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red.shade500,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Navigation")),
        body: pages[pagesIndex],
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.group), label: 'Data'),
            NavigationDestination(
                icon: Icon(Icons.contact_page), label: 'Contact'),
          ],
          selectedIndex: pagesIndex,
          onDestinationSelected: (int index) {
            setState(() {
              pagesIndex = index;
            });
          },
        ),
      ),
    );
  }
}

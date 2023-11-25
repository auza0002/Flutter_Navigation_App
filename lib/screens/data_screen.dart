import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_navigation_app/utils/htttp_helper.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final Future<List<MainResult>> dataResult =
      HTTPClass.fetch("https://zenquotes.io/api/quotes", "get");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<MainResult>>(
        future: dataResult,
        builder:
            (BuildContext context, AsyncSnapshot<List<MainResult>> snapshot) {
          if (snapshot.hasData) {
            //build the listview
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                MainResult item = snapshot.data![index];
                return ListTile(
                  title: Text(item.a),
                  subtitle: Text(item.q),
                );
              },
            );
          } else if (snapshot.hasError) {
            //tell the user you don't like them
            return Center(child: Text('Error: ${snapshot.error.toString()}'));
          } else {
            //tell them to wait...
            return const Center(child: Text('Loading'));
          }
        },
      ),
    );
  }
}

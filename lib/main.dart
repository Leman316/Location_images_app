import 'package:flutter/material.dart';
import 'package:places_app/providers/places.dart';
import 'package:provider/provider.dart';
import 'package:places_app/screens/places_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Places(),
      child: MaterialApp(
        title: 'Locations and Images',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesList(),
      ),
    );
  }
}

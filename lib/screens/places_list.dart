import 'package:flutter/material.dart';
import 'package:places_app/screens/add_places_screen.dart';
import 'package:provider/provider.dart';
import '../providers/places.dart';

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaces.routename);
            },
          )
        ],
      ),
      body: Consumer<Places>(
        builder: (ctx, places, child) => places.items.length <= 0
            ? child
            : ListView.builder(
                itemCount: places.items.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(places.items[index].image),
                  ),
                  title: Text(places.items[index].title),
                  onTap: () {},
                ),
              ),
        child: Center(child: Text('No places Yet')),
      ),
    );
  }
}

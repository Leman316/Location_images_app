import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places_app/models/place.dart';
import '../helper/db_helper.dart';

class Places with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    print('SOME $title $image');
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        location: null,
        image: image);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchandsetPlace() async {
    final datalist = await DBHelper.getData('user_places');
    print(datalist);
    _items = datalist
        .map((e) => Place(
            id: e['id'],
            title: e['title'],
            location: null,
            image: File(e['image'])))
        .toList();

    notifyListeners();
  }
}

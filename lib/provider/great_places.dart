import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/helpers/db_helper.dart';
import 'package:great_places/model/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final place = Place(
      id: DateTime.now().toString(),
      image: image,
      title: title,
      location: null,
    );
    _items.add(place);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': place.id,
      'title': place.title,
      'image': place.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final placesData = await DBHelper.getData('user_places');
    _items = placesData
        .map((item) => Place(
              id: item['id'],
              title: item['title'],
              location: null,
              image: File(item['image']),
            ))
        .toList();
    notifyListeners();
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
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
  }
}

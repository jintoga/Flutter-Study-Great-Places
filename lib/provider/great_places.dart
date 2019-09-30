import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/helpers/db_helper.dart';
import 'package:great_places/helpers/location_helper.dart';
import 'package:great_places/model/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Future<void> addPlace(
      String title, File image, PlaceLocation pickedLocation) async {
    final address = await LocationHelper.getPlaceAddress(
      pickedLocation.lat,
      pickedLocation.lng,
    );
    final updatedLocation = PlaceLocation(
      lat: pickedLocation.lat,
      lng: pickedLocation.lng,
      address: address,
    );
    final place = Place(
      id: DateTime.now().toString(),
      image: image,
      title: title,
      location: updatedLocation,
    );
    _items.add(place);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': place.id,
      'title': place.title,
      'image': place.image.path,
      'loc_lat': place.location.lat,
      'loc_lng': place.location.lng,
      'address': place.location.address,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final placesData = await DBHelper.getData('user_places');
    _items = placesData
        .map((item) => Place(
              id: item['id'],
              title: item['title'],
              image: File(item['image']),
              location: PlaceLocation(
                lat: item['loc_lat'],
                lng: item['loc_lng'],
                address: item['address'],
              ),
            ))
        .toList();
    notifyListeners();
  }

  Place findPlaceById(String placeId) {
    return _items.firstWhere((item) => item.id == placeId);
  }
}

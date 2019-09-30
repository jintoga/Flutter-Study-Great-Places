import 'dart:convert';

import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = ''; //ToDo: API KEY
const GOOGLE_MAPS_API_KEY = ''; //TODO: MAPS API KEY

class LocationHelper {
  static String generateLocationPreviewImage({double lat, double lng}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$lat,$lng&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$lat,$lng&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_MAPS_API_KEY';
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}

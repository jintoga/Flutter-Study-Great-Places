const GOOGLE_API_KEY = 'GOOGLE_API_KEY'; //ToDO: add google api key

class LocationHelper {
  static String generateLocationPreviewImage({double lat, double lng}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$lat,$lng&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$lat,$lng&key=$GOOGLE_API_KEY';
  }
}

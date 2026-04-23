import 'package:geolocator/geolocator.dart';

class UserLocation {
  final Position position;
  final String shortAddress; // Ex: "Lagos, NG"
  final String fullAddress; // Ex: "DAKAR, SENEGAL"

  UserLocation({
    required this.position,
    required this.shortAddress,
    required this.fullAddress,
  });
}

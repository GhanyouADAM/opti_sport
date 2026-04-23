import 'package:fpdart/fpdart.dart';
import 'package:geolocator/geolocator.dart';

import '../../core/constants/errors.dart';

// Cette classe gere tout ce qui est lie a l'obtention des coordonnnées  pour les calculs
class LocationService {
  LocationService();

  Future<Either<Failure, bool>> checkAndRequestPermissions() async {
    try {
      //Vérifier si le GPS est activé sur le téléphone
      final bool isGpsEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isGpsEnabled) {
        return left(LocationFailure('GPS désactivé, veuiller l\'activer'));
      }

      //Vérifier l'état de la permission de localisation
      LocationPermission permission = await Geolocator.checkPermission();

      //si la permission n'est pas accordée, demander à l'utilisateur
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return left(LocationFailure('Permission de localisation refusée'));
        }
      }

      //Cas bloquant: refus définitif
      if (permission == LocationPermission.deniedForever) {
        return Left(
          LocationFailure(
            'Permission de localisation refusée de manière permanente - Ouvrez les paramètres de l\'appareil/application',
          ),
        );
      }

      //Permission OK?
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        return right(true);
      }

      //Cas improbable (fallback)
      return left(LocationFailure('Erreur inattendue de permission'));
    } catch (e) {
      return left(ParsingFailure('Erreur inattendue de permission : $e'));
    }
  }

  // Retourne les coordonnées actuelles de l'utilisateur
  Future<Either<Failure, Position>> getCurrentLocation() async {
    try {
      final permissonStatus = await checkAndRequestPermissions();

      if (permissonStatus.isLeft()) {
        return left(LocationFailure('Permission de localisation refusée'));
      }

      final Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.medium,
          distanceFilter: 0,
        ),
      );
      return right(position);
    } catch (e) {
      // Gestion des exceptions spécifiques de geolocator
      if (e is LocationServiceDisabledException) {
        return Left(LocationFailure("GPS désactivé"));
      }
      if (e is PermissionDeniedException) {
        return Left(LocationFailure("Permission refusée"));
      }
      return Left(LocationFailure("Erreur de localisation : $e"));
    }
  }
}

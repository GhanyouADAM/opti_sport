abstract class Failure implements Exception {
  final String? message;
  Failure([this.message]);
  @override
  String toString() => message ?? 'Erreur inconnue';
}

class NetworkFailure extends Failure {
  NetworkFailure([String? message])
    : super(message ?? 'Pas de connexion internet');
}

class NetworkTimeoutFailure extends Failure {
  NetworkTimeoutFailure([String? message])
    : super(message ?? 'Délai d\'attente dépassé');
}

class ServerFailure extends Failure {
  int? statusCode;
  ServerFailure([String? message, this.statusCode])
    : super(message ?? 'Erreur message');
}

class CacheFailure extends Failure {
  CacheFailure([String? message]) : super(message ?? 'Pas de données en cache');
}

class LocationFailure extends Failure {
  LocationFailure([String? message])
    : super(message ?? 'impossible d\'obtenir la localisation');
}

class ParsingFailure extends Failure {
  ParsingFailure([String? message])
    : super(message ?? 'Erreur de parsing de données');
}

class AuthFailure extends Failure {
  AuthFailure([String? message])
    : super(message ?? 'Erreur d\'authentification');
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure([String? message])
    : super(message ?? 'Une erreur inattendue est survenue');
}

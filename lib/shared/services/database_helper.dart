import 'package:sqflite/sqflite.dart';


/// La creation de la base a ete deplacer dans la main
class DatabaseHelper {
  // propriété et constructeur pour l'injection de dépendance au lieu d'un singleton
  final Database _database;
  DatabaseHelper(this._database);

  /// Cette methode insere les "CachedWeatherentriees" a partir d'une liste dans une seule operation
  /// Une seule erreur d'insertion fait echouer toute l'operation.(soit ca rentre ensmble ou non)
  Future<void> insertWeatherEntries(List<Map<String, dynamic>> entries) async {
    Batch batch = _database.batch();
    for (var entry in entries) {
      batch.insert(
        'cached_weather_entries',
        entry,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit();
  }

  // Récupère une liste de CachedWeatherEntries en filtrant sur les parametres from et to
  Future<List<Map<String, dynamic>>> getWeatherEntries({
    required String from,
    required String to,
  }) async {
    return await _database.query(
      'cached_weather_entries',
      where: 'hour BETWEEN ? AND ?',
      whereArgs: [from, to],
      orderBy: 'hour ASC',
    );
  }

  /// Recuperes la date de la derniere grosse insertion via batch
  ///  pour determiner la validité du cache(on relance un requete si le cache est expiré)
  /// Si la table est vide, retourne null
  Future<String?> getLatestCachedAt() async {
    final result = await _database.query(
      'cached_weather_entries',
      columns: ['cached_at'],
      orderBy: 'cached_at DESC',
      limit: 1,
    );
    return result.isNotEmpty ? result.first['cached_at'] as String : null;
  }

  // Recuperes les coordonnees de la derniere grosse insertion via batch
  Future<Map<String, dynamic>?> getCachedLocation() async {
    final result = await _database.query(
      'cached_weather_entries',
      columns: ['latitude', 'longitude'],
      limit: 1,
    );
    return result.isNotEmpty ? result.first : null;
  }

  // Permet de vider le cache avant l'appel avant la nouvelle requête
  Future<void> clearWeatherEntries() async {
    await _database.delete('cached_weather_entries');
  }

  // Met en cache les données d'un utilisateur
  Future<void> saveUserProfile(Map<String, dynamic> profile) async {
    await _database.insert(
      'cached_user_profile',
      profile,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Récupère le profil de l'utilisateur en fonction de son id
  /// l'id est toujours egal a 1
  /// Si le profil n'existe pas, retourne null
  Future<Map<String, dynamic>?> getUserProfile() async {
    final result = await _database.query(
      'cached_user_profile',
      where: 'id = ?',
      whereArgs: [1],
      limit: 1,
    );
    return result.isNotEmpty ? result.first : null;
  }
}

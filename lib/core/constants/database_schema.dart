import 'package:sqflite/sqflite.dart';

class DatabaseSchema {
  static const String weatherEntries = 'cached_weather_entries';
  static const String userProfile = 'cached_user_profile';

  static Future<void> createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $weatherEntries(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        hour TEXT NOT NULL,
        latitude REAL NOT NULL,
        longitude REAL NOT NULL,
        temperature REAL NOT NULL,
        apparent_temperature REAL NOT NULL,
        humidity INTEGER NOT NULL,
        precipitation_probability INTEGER NOT NULL,
        windspeed REAL NOT NULL,
        uv_index REAL NOT NULL,
        cloudcover INTEGER NOT NULL,
        weathercode INTEGER NOT NULL,
        pm25 REAL ,
        us_aqi INTEGER,
        cached_at TEXT NOT NULL
        )
      ''');

    await db.execute(''' 
      CREATE TABLE IF NOT EXISTS $userProfile(
        id INTEGER PRIMARY KEY,
        user_id TEXT,
        activity_type TEXT NOT NULL,
        fitness_level TEXT NOT NULL,
        preferred_start_hour INTEGER NOT NULL,
        preferred_end_hour INTEGER NOT NULL,
        heat_sensitivity TEXT NOT NULL,
        updated_at TEXT NOT NULL
        )
      ''');
    await db.execute('''
    CREATE INDEX idx_weather_hour 
ON cached_weather_entries(hour);
''');
    await db.execute('''
    CREATE INDEX idx_weather_location 
ON cached_weather_entries(latitude, longitude);
    ''');
  }

  DatabaseSchema._();
}

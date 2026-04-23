# Architecture des Services

Trois classes constituent le socle de cette application. Elles sont toutes consommées par le **WeatherRepository**, qui fait le pont entre les fonctionnalités (features) et le backend. C'est le cœur de la logique de données de l'application.

---

## 1. DatabaseHelper
Gère le caching et la persistance locale via SQLite. Elle permet d'optimiser les performances et de réduire les appels API inutiles.

### Méthodes clés (7) :
*   `insertWeatherEntries` : Ajoute une liste de `CachedWeatherEntries` (converties en `Map<String, dynamic>`).
*   `getWeatherEntries` : Récupère les prévisions filtrées selon les préférences horaires de l'utilisateur (`from` et `to`).
*   `getLatestCachedAt` : Récupère la date de la dernière mise à jour du cache.
*   `getCachedLocation` : Récupère les coordonnées (latitude/longitude) pour vérifier la validité géographique du cache.
*   `clearWeatherEntries` : Vide le cache avant une nouvelle synchronisation.
*   `saveUserProfile` : Persiste les données de profil de l'utilisateur.
*   `getUserProfile` : Récupère le profil utilisateur par ID.

---

## 2. LocationService
Une classe utilitaire dédiée à la gestion de la géolocalisation.

*   **Rôle** : Gère les demandes de permissions et récupère la position actuelle de l'utilisateur.
*   **Impact** : Ces coordonnées sont essentielles pour valider le cache ou déclencher de nouveaux calculs météo.

---

## 3. WeatherApiServices
Le moteur de communication avec les API externes. Elle convertit les données brutes (JSON) en entités exploitables par l'application.

### Fonctionnalités principales :
*   `fetchWeather` : Récupère les données météorologiques actuelles et prévisionnelles.
*   `fetchAirQuality` : Récupère les indices de qualité de l'air.
*   `_handleDioException` : Méthode utilitaire centralisant la gestion des erreurs réseau et API.

---

> **Note :** Le `WeatherRepository` orchestre ces trois services pour décider s'il doit servir une donnée cachée (via `DatabaseHelper`) ou rafraîchir les données (via `WeatherApiServices` + `LocationService`).

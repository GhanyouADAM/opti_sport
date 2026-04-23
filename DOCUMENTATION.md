# OptiSport - Project Documentation

## 📝 Overview
**OptiSport** is a specialized fitness-focused weather application designed to help athletes and fitness enthusiasts find the **optimal window for training** based on real-time and forecasted weather conditions. Unlike standard weather apps, OptiSport calculates a personalized "Training Score" by correlating weather metrics (temperature, humidity, UV index, air quality, etc.) with the user's personal profile (fitness level, sport type, and heat sensitivity).

---

## 🚀 Key Features

### 1. Training Score & Recommendations (Home)
- **Personalized Score**: A daily score (0-100) indicating how favorable the conditions are for training.
- **Optimal Window**: Identifies the specific time range during the day when conditions are at their peak for the selected activity.
- **Dynamic Reasons & Warnings**: Provides specific context for the score (e.g., "High humidity," "Perfect temperature") and critical alerts (e.g., "High UV risk").

### 2. Detailed Forecast
- **Hourly Timeline**: A granular view of how weather conditions (Temp, Wind, Rain, etc.) and training scores fluctuate throughout the day.
- **Multi-day Forecast**: Planning tools for upcoming training sessions over the next few days.

### 3. User Personalization (Profile)
- **Activity Selection**: Support for various sports (Running, Cycling, etc.) which influences how weather impacts the training score.
- **Fitness Level**: Profiles (Beginner, Intermediate, Advanced) to adjust the rigor of weather-based advice.
- **Physiological Preferences**: Users can set their **Heat Sensitivity** and preferred training hours (e.g., morning vs. evening) to refine the recommendation algorithm.

### 4. Authentication & Sync
- **Secure Access**: User accounts via Supabase.
- **Cloud Sync**: User preferences and profile data are synchronized across devices.
- **Local Cache**: Uses Sqflite for offline access to recent forecast data and settings.

---

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [Riverpod](https://riverpod.dev/) (with code generation)
- **Backend/Auth**: [Supabase](https://supabase.com/)
- **Local Database**: [Sqflite](https://pub.dev/packages/sqflite)
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router)
- **Networking**: [Dio](https://pub.dev/packages/dio)
- **Serialization**: [Dart Mappable](https://pub.dev/packages/dart_mappable)
- **Design System**: Custom dark-themed UI following Material 3 principles.

---

## 📂 Project Structure

The project follows a **Feature-First Architecture**:

- `lib/core/`: Global configurations, theme, routing, and shared constants.
- `lib/features/`: Modularized business logic:
    - `authentication/`: Login, signup, and session management.
    - `forecast/`: Weather forecasting logic and models.
    - `home/`: Dashboard, score calculation display, and recommendation logic.
    - `profile/`: User settings, sport preferences, and physiological profiles.
    - `timeline/`: Granular hourly data visualization.
- `lib/shared/`: Reusable widgets (buttons, indicators), base models, and core providers (Dio, Database, Location).

---

## 🧮 Calculation Logic (The "Brain")
The application uses an internal scoring algorithm that weighs:
1. **Base Weather**: Temperature, Humidity, and Wind Speed.
2. **Safety Metrics**: UV Index, Air Quality (AQI), and Precipitation.
3. **User Profile**: A "High" heat sensitivity user will receive a lower score during peak sun hours compared to a "Low" sensitivity user.
4. **Activity Type**: The impact of wind speed might be weighted differently for cycling versus running.

---

## 🛠 Setup & Configuration
- **Environment**: Flutter SDK (latest stable).
- **Backend**: Requires a Supabase project. URL and Keys are managed in `lib/core/constants/supabase_constant.dart`.
- **Local DB**: Initialized via `sqflite` on app startup (`optisport.db`).

---

# OptiSport - Documentation du Projet (Français)

## 📝 Présentation
**OptiSport** est une application météorologique spécialisée dans le fitness, conçue pour aider les athlètes et les passionnés de sport à trouver le **créneau optimal pour s'entraîner** en fonction des conditions météo en temps réel et des prévisions. Contrairement aux applications météo classiques, OptiSport calcule un "Training Score" personnalisé en corrélant les mesures météo (température, humidité, indice UV, qualité de l'air, etc.) avec le profil personnel de l'utilisateur (niveau de forme, type de sport et sensibilité à la chaleur).

---

## 🚀 Fonctionnalités Clés

### 1. Score d'Entraînement & Recommandations (Accueil)
- **Score Personnalisé** : Un score quotidien (0-100) indiquant à quel point les conditions sont favorables à l'entraînement.
- **Créneau Optimal** : Identifie la plage horaire spécifique de la journée où les conditions sont idéales pour l'activité sélectionnée.
- **Raisons & Avertissements Dynamiques** : Fournit un contexte spécifique pour le score (ex: "Humidité élevée", "Température parfaite") et des alertes critiques (ex: "Risque UV élevé").

### 2. Prévisions Détaillées
- **Chronologie Horaire** : Une vue granulaire de l'évolution des conditions météo (Temp, Vent, Pluie, etc.) et des scores d'entraînement tout au long de la journée.
- **Prévisions sur Plusieurs Jours** : Outils de planification pour les prochaines sessions d'entraînement sur les jours à venir.

### 3. Personnalisation de l'Utilisateur (Profil)
- **Sélection de l'Activité** : Supporte divers sports (Course à pied, Cyclisme, etc.) ce qui influence l'impact de la météo sur le score d'entraînement.
- **Niveau de Forme** : Profils (Débutant, Intermédiaire, Avancé) pour ajuster la rigueur des conseils basés sur la météo.
- **Préférences Physiologiques** : Les utilisateurs peuvent définir leur **Sensibilité à la Chaleur** et leurs heures d'entraînement préférées (ex: matin vs soir) pour affiner l'algorithme de recommandation.

### 4. Authentification & Synchronisation
- **Accès Sécurisé** : Comptes utilisateurs via Supabase.
- **Synchronisation Cloud** : Les préférences et les données de profil de l'utilisateur sont synchronisées sur tous les appareils.
- **Cache Local** : Utilise Sqflite pour un accès hors ligne aux données de prévisions récentes et aux paramètres.

---

## 🛠 Pile Technique

- **Framework** : [Flutter](https://flutter.dev/)
- **Gestion d'État** : [Riverpod](https://riverpod.dev/) (avec génération de code)
- **Backend/Auth** : [Supabase](https://supabase.com/)
- **Base de Données Locale** : [Sqflite](https://pub.dev/packages/sqflite)
- **Navigation** : [GoRouter](https://pub.dev/packages/go_router)
- **Réseau** : [Dio](https://pub.dev/packages/dio)
- **Sérialisation** : [Dart Mappable](https://pub.dev/packages/dart_mappable)
- **Système de Design** : Interface personnalisée en mode sombre suivant les principes de Material 3.

---

## 📂 Structure du Projet

Le projet suit une **Architecture par Fonctionnalité (Feature-First)** :

- `lib/core/` : Configurations globales, thème, routage et constantes partagées.
- `lib/features/` : Logique métier modularisée :
    - `authentication/` : Connexion, inscription et gestion de session.
    - `forecast/` : Logique de prévisions météo et modèles.
    - `home/` : Tableau de bord, affichage du calcul du score et logique de recommandation.
    - `profile/` : Paramètres utilisateur, préférences sportives et profils physiologiques.
    - `timeline/` : Visualisation granulaire des données horaires.
- `lib/shared/` : Widgets réutilisables (boutons, indicateurs), modèles de base et providers centraux (Dio, Base de données, Localisation).

---

## 🧮 Logique de Calcul (Le "Cerveau")
L'application utilise un algorithme de scoring interne qui pondère :
1. **Météo de Base** : Température, Humidité et Vitesse du Vent.
2. **Mesures de Sécurité** : Indice UV, Qualité de l'Air (AQI) et Précipitations.
3. **Profil Utilisateur** : Un utilisateur "Très sensible" à la chaleur recevra un score plus bas pendant les heures de pic d'ensoleillement par rapport à un utilisateur "Peu sensible".
4. **Type d'Activité** : L'impact de la vitesse du vent peut être pondéré différemment pour le cyclisme par rapport à la course à pied.

---

## 🛠 Installation & Configuration
- **Environnement** : SDK Flutter (dernière version stable).
- **Backend** : Nécessite un projet Supabase. L'URL et les clés sont gérées dans `lib/core/constants/supabase_constant.dart`.
- **BD Local** : Initialisée via `sqflite` au démarrage de l'application (`optisport.db`).

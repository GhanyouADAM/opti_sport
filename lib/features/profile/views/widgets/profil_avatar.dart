import 'package:flutter/material.dart';

import '../../../../core/constants/app_icon.dart';
// import 'chemin/vers/app_icon.dart';

class OptiSportProfileAvatar extends StatelessWidget {
  final String? imageUrl; // Si null, on affiche une icône par défaut
  final VoidCallback onEditTap;
  final double size;

  const OptiSportProfileAvatar({
    super.key,
    this.imageUrl,
    required this.onEditTap,
    this.size = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    const Color accentColor = Color(0xFF00FFAA); // Ton vert néon

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          // 1. L'image de profil
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF1E2228), // Fond sombre
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.1),
                width: 2.0,
              ),
              image: imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(
                        imageUrl!,
                      ), // Ou AssetImage si c'est en local
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: imageUrl == null
                ? Icon(
                    Icons.person_outline, // Fallback si pas d'image
                    size: size * 0.5,
                    color: Colors.white.withValues(alpha: 0.5),
                  )
                : null,
          ),

          // 2. Le petit badge d'édition
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: onEditTap,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: accentColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(
                      0xFF0B101A,
                    ), // Couleur du fond de la page pour créer un espace
                    width: 3.0,
                  ),
                ),
                child: const AppIcon(
                  name: "edit_pencil", // Ton SVG de crayon
                  size: 14.0,
                  primaryColor: Color(0xFF0B101A), // Sombre pour le contraste
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

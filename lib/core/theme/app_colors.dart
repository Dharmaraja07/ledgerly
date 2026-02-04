import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF09090B); // Very dark zinc
  static const Color surface = Color(0xFF18181B); // Slightly lighter
  static const Color surfaceHighlight = Color(0xFF27272A); // For cards
  
  static const Color primary = Color(0xFF00E676); // Vibrant Green
  static const Color primaryDark = Color(0xFF00C853);
  
  static const Color secondary = Color(0xFF651FFF); // Deep Purple
  static const Color accent = Color(0xFF00B0FF); // Light Blue

  static const Color textPrimary = Color(0xFFFAFAFA);
  static const Color textSecondary = Color(0xFFA1A1AA);
  
  static const Color error = Color(0xFFFF5252);
  static const Color success = Color(0xFF00E676);
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF00E676), Color(0xFF69F0AE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF18181B), Color(0xFF1F1F23)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

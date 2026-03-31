import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF343432); // Warm Dark Grey
  static const Color surface = Color(0xFF454541); // Lighter Warm Grey
  static const Color surfaceHighlight = Color(0xFF565652); // Even lighter
  
  static const Color primary = Color(0xFFFFD54F); // Warm Yellow
  static const Color primaryDark = Color(0xFFFFC107);
  
  static const Color secondary = Color(0xFF7E57C2); // Deep Purple (kept for accents)
  static const Color accent = Color(0xFF29B6F6); // Light Blue

  static const Color textPrimary = Color(0xFFF5F5F0); // Off-white
  static const Color textSecondary = Color(0xFFAAAAA0); // Warm Grey Text
  
  static const Color error = Color(0xFFE57373); // Soft Red
  static const Color success = Color(0xFF81C784); // Soft Green
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFFFFD54F), Color(0xFFFFCA28)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFF454541), Color(0xFF3E3E3A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

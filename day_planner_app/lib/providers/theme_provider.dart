import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeBoxName = 'theme_preferences';
  static const String _isDarkModeKey = 'is_dark_mode';

  late Box _themeBox;
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  static const Color lightPrimary = Color(0xFF667EEA);
  static const Color lightSecondary = Color(0xFF764BA2);
  static const Color lightAccent = Color(0xFFF093FB);
  static const Color lightBackground = Color(0xFFF8FAFF);
  static const Color lightSurface = Color(0xFFE2E8F0);
  static const Color lightCard = Colors.white;
  static const Color lightText = Color(0xFF2D3748);
  static const Color lightTextSecondary = Color(0xFF718096);
  static const Color lightSuccess = Color(0xFF38B2AC);
  static const Color lightError = Color(0xFFFF6B6B);
  static const Color lightWarning = Color(0xFFFFE66D);

  // Enhanced Dark Theme Colors
  static const Color darkPrimary = Color(0xFF8B5CF6);
  static const Color darkSecondary = Color(0xFFA855F7);
  static const Color darkAccent = Color(0xFFEC4899);
  static const Color darkBackground = Color(0xFF0A0A0A);
  static const Color darkSurface = Color(0xFF1A1A1A);
  static const Color darkCard = Color(0xFF2A2A2A);
  static const Color darkCardHover = Color(0xFF3A3A3A);
  static const Color darkText = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFF94A3B8);
  static const Color darkSuccess = Color(0xFF10B981);
  static const Color darkError = Color(0xFFEF4444);
  static const Color darkWarning = Color(0xFFF59E0B);

  Future<void> init() async {
    _themeBox = await Hive.openBox(_themeBoxName);
    _isDarkMode = _themeBox.get(_isDarkModeKey, defaultValue: false);
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await _themeBox.put(_isDarkModeKey, _isDarkMode);
    notifyListeners();
  }

  // Get current theme colors
  Color get primaryColor => _isDarkMode ? darkPrimary : lightPrimary;
  Color get secondaryColor => _isDarkMode ? darkSecondary : lightSecondary;
  Color get accentColor => _isDarkMode ? darkAccent : lightAccent;
  Color get backgroundColor => _isDarkMode ? darkBackground : lightBackground;
  Color get surfaceColor => _isDarkMode ? darkSurface : lightSurface;
  Color get cardColor => _isDarkMode ? darkCard : lightCard;
  Color get cardHoverColor => _isDarkMode ? darkCardHover : lightCard;
  Color get textColor => _isDarkMode ? darkText : lightText;
  Color get textSecondaryColor =>
      _isDarkMode ? darkTextSecondary : lightTextSecondary;
  Color get successColor => _isDarkMode ? darkSuccess : lightSuccess;
  Color get errorColor => _isDarkMode ? darkError : lightError;
  Color get warningColor => _isDarkMode ? darkWarning : lightWarning;

  // Get gradient colors
  List<Color> get primaryGradient => _isDarkMode
      ? [darkPrimary, darkSecondary, darkAccent]
      : [lightPrimary, lightSecondary, lightAccent];

  List<Color> get cardGradient =>
      _isDarkMode ? [darkCard, darkCardHover] : [lightCard, lightSurface];

  List<Color> get successGradient => _isDarkMode
      ? [darkSuccess, Color(0xFF059669)]
      : [lightSuccess, Color(0xFF319795)];

  // Enhanced completed task gradients using app's primary colors with subtle variation
  List<Color> get completedTaskGradient => _isDarkMode
      ? [
          Color(0xFF667EEA).withValues(alpha: 0.8),
          Color(0xFF764BA2).withValues(alpha: 0.8),
        ] // App primary colors with transparency
      : [
          Color(0xFF667EEA).withValues(alpha: 0.1),
          Color(0xFF764BA2).withValues(alpha: 0.1),
        ]; // App primary colors with transparency

  // Completed task text colors using app's text colors
  Color get completedTaskTextColor => _isDarkMode
      ? darkText.withValues(alpha: 0.7) // App text color with transparency
      : lightText.withValues(alpha: 0.7); // App text color with transparency

  Color get completedTaskTextSecondaryColor => _isDarkMode
      ? darkTextSecondary.withValues(
          alpha: 0.6,
        ) // App secondary text with transparency
      : lightTextSecondary.withValues(
          alpha: 0.6,
        ); // App secondary text with transparency

  ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.indigo,
      scaffoldBackgroundColor: lightBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: lightText,
        titleTextStyle: TextStyle(
          color: lightText,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: lightCard,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: lightText),
        bodyMedium: TextStyle(color: lightTextSecondary),
        titleLarge: TextStyle(color: lightText, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(color: lightText, fontWeight: FontWeight.w600),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightPrimary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: lightPrimary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: lightTextSecondary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: lightTextSecondary.withValues(alpha: 0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: lightPrimary),
        ),
        labelStyle: const TextStyle(color: lightTextSecondary),
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: lightCard,
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.purple,
      scaffoldBackgroundColor: darkBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: darkText,
        titleTextStyle: TextStyle(
          color: darkText,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: darkCard,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: darkText),
        bodyMedium: TextStyle(color: darkTextSecondary),
        titleLarge: TextStyle(color: darkText, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(color: darkText, fontWeight: FontWeight.w600),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkPrimary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: darkPrimary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: darkTextSecondary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: darkTextSecondary.withValues(alpha: 0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: darkPrimary),
        ),
        labelStyle: const TextStyle(color: darkTextSecondary),
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: darkCard,
      ),
    );
  }

  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;
}

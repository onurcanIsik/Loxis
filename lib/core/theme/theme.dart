import 'package:flutter/material.dart';

class LoxisColors {
  // HEX renkler (dark mode)
  static const String backgroundHex = "#0D0D0F";
  static const String surfaceHex = "#16161A";
  static const String primaryHex = "#6C63FF";
  static const String secondaryHex = "#8B80FF";
  static const String accentHex = "#00D4FF";

  static const String textPrimaryHex = "#ECECEC";
  static const String textSecondaryHex = "#B8B8B8";

  static const String cardHex = "#1C1C22";
  static const String dividerHex = "#2A2A33";

  static const String errorHex = "#FF6B6B";

  // Dönüştürülmüş Color değerleri
  static Color fromHex(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color get background => fromHex(backgroundHex);
  static Color get surface => fromHex(surfaceHex);
  static Color get primary => fromHex(primaryHex);
  static Color get secondary => fromHex(secondaryHex);
  static Color get accent => fromHex(accentHex);

  static Color get textPrimary => fromHex(textPrimaryHex);
  static Color get textSecondary => fromHex(textSecondaryHex);

  static Color get card => fromHex(cardHex);
  static Color get divider => fromHex(dividerHex);

  static Color get error => fromHex(errorHex);
}

class LoxisTheme {
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: LoxisColors.background,
    primaryColor: LoxisColors.primary,
    fontFamily: 'Poppins',

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: LoxisColors.textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: LoxisColors.textPrimary),
    ),

    colorScheme: ColorScheme.dark(
      primary: LoxisColors.primary,
      secondary: LoxisColors.secondary,
      surface: LoxisColors.surface,
      error: LoxisColors.error,
    ),

    cardColor: LoxisColors.card,
    dividerColor: LoxisColors.divider,

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: LoxisColors.textPrimary, fontSize: 16),
      bodyMedium: TextStyle(color: LoxisColors.textSecondary, fontSize: 14),
      titleLarge: TextStyle(
        color: LoxisColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(color: LoxisColors.textPrimary, fontSize: 18),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: LoxisColors.surface,
      hintStyle: TextStyle(color: LoxisColors.textSecondary),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: LoxisColors.divider),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: LoxisColors.primary),
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LoxisColors.primary,
        foregroundColor: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      ),
    ),
  );
}

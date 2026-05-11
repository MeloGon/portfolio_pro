import 'package:flutter/material.dart';

const Color bgPrimary = Color(0xFF071013);
const Color bgSurface = Color(0xFF0F1B1E);
const Color bgCard = Color(0xFF162326);
const Color accentPrimary = Color(0xFF2DD4BF);
const Color accentSecondary = Color(0xFFFF6B5A);
const Color accentWarm = Color(0xFFF2C94C);
const Color textPrimary = Color(0xFFE8F1F2);
const Color textSecondary = Color(0xFFA1B4B8);
const Color borderColor = Color(0xFF263A3F);

const seedColor = accentPrimary;

class AppTheme {
  final bool isDarkmode;

  AppTheme({required this.isDarkmode});

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: seedColor,
    brightness: isDarkmode ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: isDarkmode ? bgPrimary : const Color(0xFFF6F1E8),
    cardTheme: CardThemeData(
      color: isDarkmode ? bgCard : Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isDarkmode ? borderColor : const Color(0xFFE6D9C8),
        ),
      ),
    ),
    listTileTheme: const ListTileThemeData(iconColor: accentPrimary),
    chipTheme: ChipThemeData(
      backgroundColor: isDarkmode ? bgSurface : const Color(0xFFFFFBF3),
      side: BorderSide(color: accentPrimary.withValues(alpha: 0.3)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    ),
    fontFamily: 'HostGrotesk',
  );
}

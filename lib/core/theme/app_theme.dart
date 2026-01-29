import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // رنگ‌های اصلی اپلیکیشن (تم دارک گیمینگ)
  static const Color background = Color(0xFF121212); // مشکی خیلی تیره
  static const Color surface = Color(0xFF1E1E2C);    // رنگ کارت‌ها
  static const Color primary = Color(0xFF6C63FF);    // بنفش نئونی
  static const Color accent = Color(0xFFFFD700);     // طلایی
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB3B3B3);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      
      // تنظیمات فونت
      textTheme: TextTheme(
        displayLarge: GoogleFonts.rajdhani(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        titleLarge: GoogleFonts.rajdhani(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        bodyMedium: GoogleFonts.roboto(
          fontSize: 14,
          color: textSecondary,
        ),
      ),
      
      // بخش cardTheme حذف شد چون ما در ویجت‌ها استایل دستی می‌دهیم
      // و باعث رفع ارور تایپ می‌شود.
      
      // تنظیمات آیکون‌ها
      iconTheme: const IconThemeData(
        color: primary,
      ),
    );
  }
}
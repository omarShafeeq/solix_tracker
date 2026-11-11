import 'package:flutter/material.dart';

/// Official SOLIX ERP colors and the neutral shades derived from them.
abstract final class AppColors {
  static const Color primary = Color(0xFF0D478A);
  static const Color primaryDark = Color(0xFF083266);
  static const Color primaryHover = Color(0xFF165A9E);
  static const Color accent = Color(0xFF06AEE0);
  static const Color accentSoft = Color(0xFFE6F7FC);
  static const Color white = Color(0xFFFFFFFF);

  static const Color canvas = Color(0xFFF3F7FB);
  static const Color panel = white;
  static const Color line = Color(0xFFD5E3F0);
  static const Color selected = Color(0xFFE5F6FC);

  static const Color text = Color(0xFF0C3A68);
  static const Color textMuted = Color(0xFF5C7590);
  static const Color textSubtle = Color(0xFF7D93A8);

  /// Vehicle status only.
  static const Color online = Color(0xFF15803D);
  static const Color offline = Color(0xFFDC2626);
  static const Color warning = Color(0xFFD97706);
  static const Color parked = warning;
  static const Color blocked = Color(0xFF6B7280);
  static const Color moving = accent;
  static const Color warningSurface = Color(0xFFFFF7ED);
}

abstract final class AppRadius {
  static const double sm = 10;
  static const double md = 12;
  static const double lg = 14;
}

abstract final class AppShadows {
  static const List<BoxShadow> card = <BoxShadow>[
    BoxShadow(color: Color(0x1A0D478A), blurRadius: 18, offset: Offset(0, 6)),
  ];
}

abstract final class AppTheme {
  static ThemeData light() {
    const scheme = ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.accent,
      onSecondary: AppColors.primaryDark,
      tertiary: AppColors.accent,
      onTertiary: AppColors.primaryDark,
      error: AppColors.offline,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.text,
      outline: AppColors.line,
      outlineVariant: AppColors.line,
      shadow: Color(0x330D478A),
      surfaceTint: AppColors.white,
    );

    final radius = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.md),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.canvas,
      fontFamily: 'Inter',
      fontFamilyFallback: const <String>[
        'Segoe UI',
        'Tahoma',
        'Arial',
        'Noto Naskh Arabic',
        'Noto Sans Arabic',
        'sans-serif',
      ],
      splashColor: AppColors.accent.withValues(alpha: 0.12),
      hoverColor: AppColors.accent.withValues(alpha: 0.08),
      dividerColor: AppColors.line,
      dividerTheme: const DividerThemeData(
        color: AppColors.line,
        thickness: 1,
        space: 1,
      ),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.text,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.text,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.text,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
        bodyLarge: TextStyle(fontSize: 15, color: AppColors.text),
        bodyMedium: TextStyle(fontSize: 14, color: AppColors.text),
        bodySmall: TextStyle(fontSize: 12, color: AppColors.textMuted),
        labelLarge: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.text,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.primary),
      cardTheme: CardThemeData(
        color: AppColors.panel,
        surfaceTintColor: AppColors.white,
        elevation: 1,
        shadowColor: AppColors.primary.withValues(alpha: 0.14),
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: const BorderSide(color: AppColors.line),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        shape: radius,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.lg),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.primary,
        contentTextStyle: const TextStyle(color: AppColors.white),
        behavior: SnackBarBehavior.floating,
        shape: radius,
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: AppColors.white,
        surfaceTintColor: AppColors.white,
        textStyle: const TextStyle(color: AppColors.text, fontSize: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          side: const BorderSide(color: AppColors.line),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.line,
          disabledForegroundColor: AppColors.textSubtle,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppColors.primary,
          hoverColor: AppColors.accentSoft,
        ),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.accent,
      ),
      checkboxTheme: CheckboxThemeData(
        side: const BorderSide(color: AppColors.primary, width: 1.4),
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.accent;
          }
          return AppColors.white;
        }),
        checkColor: const WidgetStatePropertyAll<Color>(AppColors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.canvas,
        hintStyle: const TextStyle(color: AppColors.textSubtle, fontSize: 14),
        prefixIconColor: AppColors.accent,
        suffixIconColor: AppColors.textMuted,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.line),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: const BorderSide(color: AppColors.accent, width: 1.6),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.white,
        selectedColor: AppColors.accentSoft,
        disabledColor: AppColors.canvas,
        side: const BorderSide(color: AppColors.line),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        labelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.text,
        ),
        secondaryLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
        checkmarkColor: AppColors.accent,
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        iconColor: AppColors.accent,
        collapsedIconColor: AppColors.primary,
        textColor: AppColors.primary,
        collapsedTextColor: AppColors.primary,
        tilePadding: EdgeInsets.symmetric(horizontal: 12),
        childrenPadding: EdgeInsets.fromLTRB(12, 0, 12, 12),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        headerBackgroundColor: AppColors.primary,
        headerForegroundColor: AppColors.white,
        shape: radius,
      ),
      timePickerTheme: const TimePickerThemeData(
        backgroundColor: AppColors.white,
        hourMinuteColor: AppColors.accentSoft,
        hourMinuteTextColor: AppColors.primary,
        dialHandColor: AppColors.accent,
        dialBackgroundColor: AppColors.canvas,
        entryModeIconColor: AppColors.primary,
      ),
    );
  }
}

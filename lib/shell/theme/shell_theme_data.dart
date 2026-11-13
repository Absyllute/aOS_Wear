import 'package:flutter/widgets.dart';

/// Defines the immutable color token contract for aOS Wear.
class ShellThemeData {
  final Color background;           // Base shell background
  final Color onBackground;         // Nav bar / inactive indicator color
  final Color surfaceContainer;     // Primary watch face / container surface
  final Color onSurfaceContainer;   // Primary text on container surfaces
  final Color surface;              // Card / item surface
  final Color onSurface;            // Secondary text on surfaces
  final Color surfaceVariant;       // Inactive chips / secondary buttons
  final Color onSurfaceVariant;     // Text on variants

  // Primary Action
  final Color primary;    // Primary accent color
  final Color onPrimary;  // Text/icons rendered directly on primary color

  // System States (Similar to primary accent style)
  final Color error;      // Critical / alert states (Red)
  final Color onError;    // Text on error elements
  final Color success;    // Completion / confirmation states (Green)
  final Color onSuccess;  // Text on success elements
  final Color warning;    // Caution / low-battery states (Amber)
  final Color onWarning;  // Text on warning elements

  // Outlines & Borders
  final Color outline;           // Borders and dividers
  final Color outlineOnPrimary;  // Translucent borders on primary elements

  const ShellThemeData({
    required this.background,
    required this.onBackground,
    required this.surfaceContainer,
    required this.onSurfaceContainer,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.primary,
    required this.onPrimary,
    required this.error,
    required this.onError,
    required this.success,
    required this.onSuccess,
    required this.warning,
    required this.onWarning,
    required this.outline,
    required this.outlineOnPrimary,
  });

  /// Default Dark Theme.
  static const defaultFallback = ShellThemeData(
    background: Color(0xFF07090E),
    onBackground: Color(0xFF94A3B8),
    surfaceContainer: Color(0xFF0F172A),
    onSurfaceContainer: Color(0xFFF8FAFC),
    surface: Color(0xFF1E293B),
    onSurface: Color(0xFFE2E8F0),
    surfaceVariant: Color(0xFF334155),
    onSurfaceVariant: Color(0xFFCBD5E1),
    primary: Color(0xFF38BDF8),
    onPrimary: Color(0xFF0F172A),
    error: Color(0xFFEF4444),
    onError: Color(0xFFF8FAFC),
    success: Color(0xFF22C55E),
    onSuccess: Color(0xFF0F172A),
    warning: Color(0xFFF59E0B),
    onWarning: Color(0xFF0F172A),
    outline: Color(0xFF475569),
    outlineOnPrimary: Color(0x33FFFFFF),
  );
}
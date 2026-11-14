import 'package:aos_wear/shell/theme/shell_theme_data.dart';
import 'package:aos_wear/shell/watch_faces/templates/digital_watch_face_template.dart';
import 'package:flutter/material.dart';

import '../helper_widgets/watch_viewport.dart';

class DefaultFace extends DigitalWatchFaceTemplate {
  const DefaultFace({
    super.key,
    required super.currentTime,
    required super.batteryLevel,
    required super.isCharging,
  });

  @override
  ShellThemeData get faceTheme => const ShellThemeData(
    background: Color(0xFF060A12),
    onBackground: Color(0xFF8B9EC0),
    surfaceContainer: Color(0xFF0C1526),
    onSurfaceContainer: Color(0xFFF0F6FC),
    surface: Color(0xFF152238),
    onSurface: Color(0xFFD6E4F0),
    surfaceVariant: Color(0xFF223452),
    onSurfaceVariant: Color(0xFFB4C8E0),
    primary: Color(0xFF38BDF8),
    onPrimary: Color(0xFF061224),
    error: Color(0xFFF43F5E),
    onError: Color(0xFFF8FAFC),
    success: Color(0xFF10B981),
    onSuccess: Color(0xFF041711),
    warning: Color(0xFFF59E0B),
    onWarning: Color(0xFF1A1002),
    outline: Color(0xFF334E75),
    outlineOnPrimary: Color(0x33FFFFFF),
  );

  static const _weekdays = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  static const _months = [
    'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
    'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC',
  ];

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  Color _batteryColor(ShellThemeData theme) {
    if (isCharging) return theme.success;
    if (batteryLevel <= 20) return theme.error;
    if (batteryLevel <= 35) return theme.warning;
    return theme.primary;
  }

  @override
  Widget buildWatchFaceContent(BuildContext bCtx) {
    final theme = faceTheme;
    final hours = _twoDigits(currentTime.hour);
    final minutes = _twoDigits(currentTime.minute);
    final seconds = _twoDigits(currentTime.second);
    final dateLabel =
        '${_weekdays[currentTime.weekday - 1]}, ${_months[currentTime.month - 1]} ${currentTime.day}';

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0, -0.2),
          radius: 0.95,
          colors: [
            theme.surface,
            theme.surfaceContainer,
            theme.background,
          ],
          stops: const [0.0, 0.55, 1.0],
        ),
      ),
      padding: EdgeInsets.all(bCtx.scale(28)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top Date Pill
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: bCtx.scale(14),
              vertical: bCtx.scale(6),
            ),
            decoration: BoxDecoration(
              color: theme.surfaceVariant.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(bCtx.scale(20)),
              border: Border.all(
                color: theme.outline.withValues(alpha: 0.6),
                width: bCtx.scale(1),
              ),
            ),
            child: Text(
              dateLabel,
              style: TextStyle(
                color: theme.onSurfaceVariant,
                fontSize: bCtx.scale(13),
                fontWeight: FontWeight.w600,
                letterSpacing: bCtx.scale(1.4),
              ),
            ),
          ),

          // Center Stacked Digital Clock
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                hours,
                style: TextStyle(
                  color: theme.onSurfaceContainer,
                  fontSize: bCtx.scale(92),
                  fontWeight: FontWeight.w700,
                  height: 0.92,
                  letterSpacing: bCtx.scale(-2),
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
              SizedBox(height: bCtx.scale(4)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  // Offset to keep minutes visually centered despite seconds badge
                  SizedBox(width: bCtx.scale(30)),
                  Text(
                    minutes,
                    style: TextStyle(
                      color: theme.primary,
                      fontSize: bCtx.scale(92),
                      fontWeight: FontWeight.w300,
                      height: 0.92,
                      letterSpacing: bCtx.scale(-2),
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                  SizedBox(width: bCtx.scale(6)),
                  Text(
                    seconds,
                    style: TextStyle(
                      color: theme.onBackground,
                      fontSize: bCtx.scale(20),
                      fontWeight: FontWeight.w600,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Bottom Battery Status Pill
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: bCtx.scale(14),
              vertical: bCtx.scale(6),
            ),
            decoration: BoxDecoration(
              color: theme.surface.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(bCtx.scale(20)),
              border: Border.all(
                color: theme.outline.withValues(alpha: 0.5),
                width: bCtx.scale(1),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isCharging ? Icons.bolt_rounded : Icons.battery_std_rounded,
                  size: bCtx.scale(15),
                  color: _batteryColor(theme),
                ),
                SizedBox(width: bCtx.scale(4)),
                Text(
                  '$batteryLevel%',
                  style: TextStyle(
                    color: theme.onSurface,
                    fontSize: bCtx.scale(13),
                    fontWeight: FontWeight.w600,
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../../theme/shell_theme_data.dart';

abstract class DigitalWatchFaceTemplate extends StatelessWidget {
  const DigitalWatchFaceTemplate({
    super.key,
    required this.currentTime,
    required this.batteryLevel,
    required this.isCharging,
  });

  final DateTime currentTime;
  final int batteryLevel; // 1 - 100
  final bool isCharging;

  ShellThemeData get faceTheme;

  Widget buildWatchFaceContent(BuildContext bCtx);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: buildWatchFaceContent(context)
    );
  }
}

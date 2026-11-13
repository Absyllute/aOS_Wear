import 'package:flutter/widgets.dart';

class WatchScaleScope extends InheritedWidget {
  final double scaleFactor;

  const WatchScaleScope({
    super.key,
    required this.scaleFactor,
    required super.child,
  });

  static WatchScaleScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<WatchScaleScope>();
  }

  @override
  bool updateShouldNotify(WatchScaleScope oldWidget) {
    return oldWidget.scaleFactor != scaleFactor;
  }
}

/// BuildContext extension for easy scaling (e.g., fontSize: context.scale(40))
extension WatchScaleExtension on BuildContext {
  /// Scales a baseline design value relative to the 400x400 watch screen viewport.
  double scale(double value) {
    final scope = WatchScaleScope.of(this);
    if (scope == null) return value; // Fallback if outside viewport
    return value * scope.scaleFactor;
  }

  /// Exposes raw scale factor if needed directly
  double get watchScaleFactor {
    return WatchScaleScope.of(this)?.scaleFactor ?? 1.0;
  }
}

/// Responsive Watch Viewport Widget locked to a 400x400px baseline
class WatchViewport extends StatelessWidget {
  final Widget child;

  // 400x400 Design Baseline
  static const double screenSizeBaseline = 400.0;

  const WatchViewport({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine the maximum square size that fits the available constraints
        double size = constraints.maxWidth < constraints.maxHeight
            ? constraints.maxWidth
            : constraints.maxHeight;

        // Calculate the fluid scale factor against the 400x400 baseline
        double scaleFactor = size / screenSizeBaseline;

        return Center(
          child: SizedBox(
            width: size,
            height: size,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: WatchScaleScope(
                scaleFactor: scaleFactor,
                child: ClipRRect(
                  // Dynamic rounded corners (~32px at 400px baseline)
                  borderRadius: .circular(size * 0.08),
                  child: Container(
                    color: const Color(0xFF0F172A), // Default surface background
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

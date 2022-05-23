part of flutter_adaptive_ui;

class Breakpoint {
  /// xsmall, small, medium, large, xlarge
  final WindowType window;

  /// smallHandset, mediumHandset, largeHandset, smallTablet, largeTablet, deskto
  final DeviceType device;

  /// Number of columns for content
  final int columns;

  /// Spacing between columns
  final double gutters;

  final double margins;

  /// Following Material Design Guidlines [https://material.io/design/layout/responsive-layout-grid.html#grid-behavior]
  const Breakpoint({
    required this.columns,
    required this.device,
    required this.gutters,
    required this.margins,
    required this.window,
  });

  /// Following Material Design Guidlines [https://material.io/design/layout/responsive-layout-grid.html#grid-behavior]
  ///
  /// Use a layout builder to get [BoxConstraints]
  factory Breakpoint.fromConstraints(BoxConstraints constraints) {
    double width = 359;

    Orientation orientation = Orientation.portrait;

    if (constraints.debugAssertIsValid()) {
      width = constraints.normalize().maxWidth;
      orientation = constraints.maxHeight > constraints.maxWidth
          ? Orientation.portrait
          : Orientation.landscape;
    }

    return _calcBreakpoint(orientation, width);
  }

  /// Following Material Design Guidlines [https://material.io/design/layout/responsive-layout-grid.html#grid-behavior]
  ///
  /// Uses [BuildContext] and [MediaQuery] to calculate the device breakpoint
  ///
  /// Use [Breakpoint.fromConstraints] when the widget does not take up the full screen
  factory Breakpoint.fromMediaQuery(BuildContext context) {
    final media = MediaQuery.of(context);

    double width = 359;

    Orientation orientation = Orientation.portrait;

    width = media.size.width;
    orientation = media.orientation;

    return _calcBreakpoint(orientation, width);
  }

  static Breakpoint _calcBreakpoint(Orientation orientation, double width) {
    if (orientation == Orientation.landscape) {
      // ignore: parameter_assignments
      width += 120;
    }

    if (width >= 1920) {
      return const Breakpoint(
        columns: 12,
        gutters: 24,
        margins: 24,
        device: DeviceType.desktop,
        window: WindowType.xlarge,
      );
    }
    if (width >= 1600) {
      return const Breakpoint(
        columns: 12,
        gutters: 24,
        margins: 24,
        device: DeviceType.desktop,
        window: WindowType.large,
      );
    }
    if (width >= 1440) {
      return const Breakpoint(
        columns: 12,
        gutters: 24,
        margins: 24,
        device: DeviceType.desktop,
        window: WindowType.large,
      );
    }
    if (width >= 1280) {
      return const Breakpoint(
        columns: 12,
        gutters: 24,
        margins: 24,
        device: DeviceType.desktop,
        window: WindowType.medium,
      );
    }
    if (width >= 1024) {
      return const Breakpoint(
        columns: 12,
        gutters: 24,
        margins: 24,
        device: DeviceType.desktop,
        window: WindowType.medium,
      );
    }
    if (width >= 960) {
      return const Breakpoint(
        columns: 12,
        gutters: 24,
        margins: 24,
        device: DeviceType.largeTablet,
        window: WindowType.small,
      );
    }
    if (width >= 840) {
      return const Breakpoint(
        columns: 12,
        gutters: 24,
        margins: 24,
        device: DeviceType.largeTablet,
        window: WindowType.small,
      );
    }
    if (width >= 720) {
      return const Breakpoint(
        columns: 8,
        gutters: 24,
        margins: 24,
        device: DeviceType.largeTablet,
        window: WindowType.small,
      );
    }
    if (width >= 600) {
      return const Breakpoint(
        columns: 8,
        gutters: 16,
        margins: 16,
        device: DeviceType.smallTablet,
        window: WindowType.small,
      );
    }
    if (width >= 480) {
      return const Breakpoint(
        columns: 4,
        gutters: 16,
        margins: 16,
        device: DeviceType.largeHandset,
        window: WindowType.xsmall,
      );
    }
    if (width >= 400) {
      return const Breakpoint(
        columns: 4,
        gutters: 16,
        margins: 16,
        device: DeviceType.largeHandset,
        window: WindowType.xsmall,
      );
    }
    if (width >= 360) {
      return const Breakpoint(
        columns: 4,
        gutters: 16,
        margins: 16,
        device: DeviceType.mediumHandset,
        window: WindowType.xsmall,
      );
    }
    return const Breakpoint(
      columns: 4,
      gutters: 16,
      margins: 16,
      device: DeviceType.smallHandset,
      window: WindowType.xsmall,
    );
  }

  @override
  String toString() {
    return 'Breakpoint ($window)';
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_updated_boilerplate/data/locale/general_context.dart';
import 'package:flutter_updated_boilerplate/stores/language/store.dart';
import 'package:flutter_updated_boilerplate/stores/providers/connectivity_provider.dart';
import 'package:flutter_updated_boilerplate/utils/app_utils/color_brightness.dart';
import 'package:provider/provider.dart';

extension ExtendPadding on Widget {
  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget paddingLRTB({
    double l = 0.0,
    double r = 0.0,
    double t = 0.0,
    double b = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: l, right: r, bottom: b, top: t),
      child: this,
    );
  }

  Widget paddingHV({double h = 0.0, double v = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
      child: this,
    );
  }
}

extension ExtendVisibilty on Widget {
  Widget visibleWhen(bool condition) {
    return condition ? this : const SizedBox.shrink();
  }
}

extension ExtendColors on Color {
  bool isDarkColor() {
    double darkness = 1 - (0.299 * red + 0.587 * green + 0.114 * blue) / 255;
    if (darkness < 0.5) {
      return false;
    } else {
      return true;
    }
  }
}

extension EntendBoolOnString on String? {
  bool get isEmptyOrNull => this == null || this!.isEmpty;
  String get translate => i18n(
        CurrentApp.navigatorContext,
        this!.toLowerCase(),
      );
  String get toNumFormat {
    return RegExp(r'^[0-9]$').hasMatch(toString()) ? '0$this' : this!;
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

extension DurationExtensions on Duration {
  String get toHoursMinutes {
    return RegExp(r'^(\d+):(\d+):\d+\.')
        .firstMatch(toString())!
        .groups([1, 2])
        .map((e) => e.toNumFormat)
        .join(':');
  }
}

extension RandomListItem<T> on List<T> {
  T randomItem([String? current]) {
    final T randomOne = (List.from(this)..shuffle()).first;
    if (current != null) {
      if (randomOne == current) {
        return (List.from(this)..shuffle()).last;
      }
    }
    return randomOne;
  }
}

extension SwappableList<E> on List<E> {
  void swap(int first, int second) {
    final temp = this[first];
    this[first] = this[second];
    this[second] = temp;
  }
}

extension StateLayouts on Widget {
  Widget withConnectivityLayout() {
    return Consumer<ConnectivityProvider>(builder: (_, provider, child) {
      return provider.isOffline
          ? Stack(
              children: [
                this,
                // OfflineBar(), ur widget to be shown with the layout
              ],
            )
          : this;
    });
  }

  Widget withStatusBar({Color color = Colors.white}) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: ColorBrightness(color).matchedBrightness,
      ),
      child: this,
    );
  }
}

extension Behaviour on Widget {
  Widget withNoGlowBehaviour() {
    return ScrollConfiguration(behavior: DragGlowBehaviour(), child: this);
  }
}

class DragGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

import 'package:flutter/material.dart';

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

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
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

import 'package:flutter/material.dart';
import 'package:flutter_updated_boilerplate/utils/app_utils/widget_extensions.dart';

class AnimatedPop extends StatefulWidget {
  final VoidCallback onAnimationEnded;
  final ValueChanged<double>? onAnimationChanged;
  final Color bgColor;

  const AnimatedPop({
    required Key? key,
    required this.onAnimationEnded,
    this.onAnimationChanged,
    this.bgColor = Colors.red,
  }) : super(key: key);

  @override
  AnimatedPopState createState() => AnimatedPopState();
}

class AnimatedPopState extends State<AnimatedPop>
    with TickerProviderStateMixin {
  late AnimationController _scale2Controller;
  late Animation<double> _scale2Animation;
  ValueNotifier<bool> isShown = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _scale2Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _scale2Animation =
        Tween<double>(begin: 1.0, end: 32.0).animate(_scale2Controller)
          ..addStatusListener((status) {
            if (widget.onAnimationChanged != null) {
              widget.onAnimationChanged!(_scale2Animation.value);
            }
            if (status == AnimationStatus.completed) {
              widget.onAnimationEnded();
            }
          });
  }

  void reset() {
    isShown.value = false;
    _scale2Controller.reset();
  }

  void start() {
    isShown.value = true;
    _scale2Controller.forward();
  }

  @override
  void dispose() {
    _scale2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: isShown,
        builder: (_, isShown, __) {
          return AnimatedBuilder(
            animation: _scale2Controller,
            builder: (_, child) => Transform.scale(
              scale: _scale2Animation.value,
              child: Container(
                height: 60.0,
                width: 60.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.bgColor,
                ),
              ),
            ),
          ).visibleWhen(isShown);
        });
  }
}

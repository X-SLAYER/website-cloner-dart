import 'package:flutter/material.dart';

class EzLoader extends StatefulWidget {
  final Widget child;
  final Widget skeleton;
  final LoaderController controller;

  const EzLoader({
    Key? key,
    required this.child,
    required this.skeleton,
    required this.controller,
  }) : super(key: key);

  @override
  State<EzLoader> createState() => _EzLoaderState();
}

class _EzLoaderState extends State<EzLoader> {
  ValueNotifier<bool> loader = ValueNotifier<bool>(false);

  void set(bool status) {
    loader.value = status;
  }

  @override
  void initState() {
    super.initState();
    widget.controller._state = this;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: loader,
        builder: (_, isLoading, __) {
          return isLoading ? widget.skeleton : widget.child;
        });
  }
}

class LoaderController {
  _EzLoaderState? _state;

  void set(bool status) => _state?.set(status);
}

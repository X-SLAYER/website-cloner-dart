import 'package:flutter/material.dart';
import 'package:flutter_updated_boilerplate/utils/app_utils/widget_extensions.dart';

class ChipChoice<T> extends StatelessWidget {
  final bool isSelected;
  final String label;
  final T value;
  final ValueChanged<T>? onSelect;
  final ChoiceStyle style;

  const ChipChoice({
    Key? key,
    this.isSelected = false,
    required this.label,
    required this.value,
    this.onSelect,
    this.style = const ChoiceStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelect!(value);
      },
      borderRadius: const BorderRadius.all(Radius.circular(25)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          border: Border.all(
            width: isSelected ? 2.0 : 1.0,
            color: isSelected ? style.selectedBorderColor : style.borderColor,
          ),
          color: isSelected
              ? style.selectedBackgroundColor
              : style.backgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check,
              color: style.iconColor,
              size: 15.0,
            ).visibleWhen(isSelected),
            const SizedBox(width: 6.0).visibleWhen(isSelected),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13.0,
                  color: isSelected ? style.selectedTextColor : style.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChoiceStyle {
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconColor;
  final Color selectedTextColor;
  final Color selectedBackgroundColor;
  final Color selectedBorderColor;

  const ChoiceStyle({
    this.borderColor = Colors.black,
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.transparent,
    this.selectedTextColor = Colors.red,
    this.selectedBackgroundColor = Colors.transparent,
    this.selectedBorderColor = Colors.red,
  });
}

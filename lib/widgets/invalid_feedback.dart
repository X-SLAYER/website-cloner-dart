import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InvalidFeedBack extends StatelessWidget {
  final String? name;

  const InvalidFeedBack(this.name, [Key? key]) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return name == null || name!.isEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.triangleExclamation,
                      size: 11.0, color: Colors.red),
                  const SizedBox(width: 3.0),
                  Flexible(
                    child: AutoSizeText(
                      name as String,
                      style: const TextStyle(fontSize: 14.0, color: Colors.red),
                    ),
                  )
                ],
              )
            ],
          );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_updated_boilerplate/utils/app_utils/widget_extensions.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/assets.dart';

class NoData extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? message;
  final String? buttonName;
  final IconData? icon;
  final String imagePath;

  const NoData({
    Key? key,
    this.onPressed,
    this.message,
    this.buttonName,
    this.icon,
    this.imagePath = Assets.empty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(imagePath, width: 250),
        const SizedBox(height: 10.0),
        Flexible(
          child: Text(
            message as String,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(fontSize: 15.0),
          ),
        ),
        const SizedBox(height: 10.0),
        buttonName == null
            ? const SizedBox.shrink()
            : SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  label: Text(buttonName as String,
                      style: const TextStyle(color: Colors.white)),
                  onPressed: onPressed as Function(),
                  icon: Icon(icon, color: Colors.white),
                ),
              ).paddingHV(h: MediaQuery.of(context).size.width * 0.1),
      ],
    );
  }
}

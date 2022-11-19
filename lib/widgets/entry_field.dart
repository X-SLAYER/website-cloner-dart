import 'package:flutter/material.dart';
import 'package:flutter_updated_boilerplate/utils/app_utils/hex_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EntryField extends StatelessWidget {
  final String? name;
  final String? title;
  final bool isPassword;
  final FocusNode? node;
  final IconData? icon;
  final TextInputType keyboard;
  final Function(String name, String value)? onChanged;
  final Function()? onTap;
  final bool obsecureText;
  final bool readOnly;
  final String? error;
  final String? defaultValue;

  const EntryField({
    Key? key,
    this.name,
    this.title,
    this.isPassword = false,
    this.node,
    this.icon,
    this.keyboard = TextInputType.emailAddress,
    this.onChanged,
    this.obsecureText = true,
    this.onTap,
    this.readOnly = false,
    this.error,
    this.defaultValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: defaultValue == null
            ? null
            : (TextEditingController()..text = defaultValue!),
        readOnly: readOnly,
        onChanged: (value) {
          onChanged!(name as String, value);
        },
        focusNode: node,
        obscureText: isPassword && obsecureText,
        textInputAction: TextInputAction.done,
        keyboardType: keyboard,
        decoration: InputDecoration(
          hintText: title,
          hintStyle: const TextStyle(fontSize: 13.0),
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: (error == null || error!.isEmpty)
                    ? Colors.transparent
                    : Colors.red),
          ),
          border: InputBorder.none,
          fillColor: HexColor('#d0d6db').withOpacity(0.5),
          filled: true,
          isDense: true,
          prefixIcon: icon == null
              ? const SizedBox.shrink()
              : Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
                  child: FaIcon(icon),
                ),
          suffixIcon: isPassword
              ? IconButton(
                  icon: FaIcon(
                      obsecureText
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      size: 18.0),
                  onPressed: onTap,
                )
              : null,
        ),
      ),
    );
  }
}

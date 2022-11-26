import 'package:flutter/material.dart';

class HeadersText extends StatelessWidget {
  final TextEditingController controller;
  const HeadersText({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 10,
      decoration: const InputDecoration(
        hintText:
            'Add Headers\nExample -> key:value \n\nAccept: */*\nAccept-Language: en-US,en',
        hintStyle: TextStyle(
          color: Colors.black54,
          fontSize: 15,
        ),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
    );
  }
}

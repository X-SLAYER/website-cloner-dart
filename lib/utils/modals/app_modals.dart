import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toastr {
  Toastr._();

  static const duration = Duration(milliseconds: 1800);

  static void showErrorMessage(BuildContext context, String errorMessage) {
    Flushbar(
      message: errorMessage,
      icon: Icon(
        Icons.error,
        size: 28.0,
        color: Colors.red[300],
      ),
      duration: duration,
      leftBarIndicatorColor: Colors.red[300],
    ).show(context);
  }

  static void showStaticModal(
    BuildContext context,
    String title,
    String message,
  ) {
    Flushbar(
      title: title,
      message: message,
      duration: duration,
    ).show(context);
  }

  static void showSuccessModal(BuildContext context, String message) {
    Flushbar(
      leftBarIndicatorColor: Colors.green[300],
      icon: Icon(
        Icons.done,
        size: 28.0,
        color: Colors.green[300],
      ),
      message: message,
      duration: duration,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }

  static void success(BuildContext context, String message) {
    Flushbar(
      leftBarIndicatorColor: Colors.green[300],
      icon: Icon(
        Icons.done,
        size: 28.0,
        color: Colors.green[300],
      ),
      message: message,
      duration: const Duration(milliseconds: 2500),
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
    ).show(context);
  }

  static void showFloatingModal(
      BuildContext context, String title, String message) {
    Flushbar(
      title: title,
      message: message,
      duration: duration,
      borderRadius: BorderRadius.circular(8.0),
      flushbarStyle: FlushbarStyle.FLOATING,
    ).show(context);
  }

  static void showToast(String message,
      [ToastGravity gravity = ToastGravity.BOTTOM]) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: Colors.black.withOpacity(0.6),
      textColor: Colors.white,
      fontSize: 15.0,
    );
  }
}

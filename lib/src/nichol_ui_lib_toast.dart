import 'package:flutter/material.dart';

class NicholUILibToast {
  /// Displays a toast message on all platforms.
  ///
  /// [context] is required to access the `Overlay`.
  /// [msg] is the text to display.
  /// [toastLength] determines the duration of the toast (short or long).
  /// [gravity] specifies where the toast appears on the screen (e.g., top, center, bottom).
  /// [timeInSecForIosWeb] overrides the duration in seconds for web/iOS (default: 1 second).
  /// [backgroundColor] sets the background color of the toast.
  /// [textColor] sets the text color.
  /// [fontSize] determines the size of the message text.
  static void show({
    required BuildContext context,
    required String msg,
    ToastLength toastLength = ToastLength.short,
    ToastGravity gravity = ToastGravity.bottom,
    Color backgroundColor = Colors.grey,
    Color textColor = Colors.white,
    double fontSize = 16.0,
  }) {
    final overlay = Overlay.of(context, rootOverlay: true);

    // Convert toast length into a duration
    final duration = toastLength == ToastLength.short
        ? Duration(seconds: 3)
        : Duration(seconds: 10);

    // Calculate vertical alignment based on gravity
    double? top;
    double? bottom;
    switch (gravity) {
      case ToastGravity.top:
        top = 50.0;
        break;
      case ToastGravity.bottom:
        bottom = 50.0;
        break;
    }

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: top,
        bottom: bottom,
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: backgroundColor.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              msg,
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor, fontSize: fontSize),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Remove the toast after the specified duration
    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }
}

/// Enums for toast length and gravity
enum ToastLength { short, long }
enum ToastGravity { top, bottom }


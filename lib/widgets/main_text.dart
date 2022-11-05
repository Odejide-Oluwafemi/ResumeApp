import 'package:flutter/material.dart';

/// A Simple Text with adjustable theming for Headers
class MainText extends StatelessWidget {
  /// Text
  final String text;

  /// Text Size
  final double size;

  /// Text Color
  final Color? color;

  /// Text Weight
  final FontWeight fontWeight;

  const MainText(
    this.text, {
    super.key,
    this.size = 26,
    this.color,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: size,
              fontWeight: fontWeight,
            ));
  }
}

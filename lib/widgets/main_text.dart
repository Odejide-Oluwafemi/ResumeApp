import 'package:flutter/material.dart';
import 'package:resume_app/misc/app_colors.dart';

class MainText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
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

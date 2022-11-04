import 'package:flutter/material.dart';
import 'package:resume_app/misc/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  const AppText(
    this.text, {
    super.key,
    this.size = 16,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: size,
            ));
  }
}

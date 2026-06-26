import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const TextTitle({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? context.textTheme.headlineLarge?.copyWith(fontSize: 20),
    );
  }
}

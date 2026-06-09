import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  final String text;
  const SubtitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.titleLarge?.copyWith(
        fontSize: 18.0,
        height: 1.00,
      ),
    );
  }
}

import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class TermsAndPrivacy extends StatelessWidget {
  final Color? normalColor;
  final Color? importantColor;
  const TermsAndPrivacy({super.key, this.normalColor, this.importantColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: context.textTheme.displaySmall?.copyWith(color: normalColor),
          children: [
            const TextSpan(text: 'By continuing you agree to the '),
            TextSpan(
              text: 'Terms of Service',
              style: context.textTheme.labelSmall?.copyWith(
                color: importantColor,
                decoration: TextDecoration.underline,
                decorationColor: importantColor,
              ),
            ),
            const TextSpan(text: ' and\n'),
            TextSpan(
              text: 'Privacy Policy',
              style: context.textTheme.labelSmall?.copyWith(
                color: importantColor,
                decoration: TextDecoration.underline,
                decorationColor: importantColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

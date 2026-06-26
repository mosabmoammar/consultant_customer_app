import 'package:flutter/material.dart';

import '../../../../../../core/utils/extensions.dart';

class HeaderList extends StatelessWidget {
  final String title;
  final String buttonText;
  final void Function() onTap;
  const HeaderList({
    super.key,
    required this.title,
    this.buttonText = 'View all',
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme.headlineMedium?.copyWith(
            fontSize: 18.0,
            letterSpacing: -0.2,
          ),
        ),

        InkWell(
          onTap: onTap,
          child: Text(
            'View all',
            style: context.textTheme.labelMedium?.copyWith(
              color: const Color(0xFFF47839),
              letterSpacing: -0.2,
            ),
          ),
        ),
      ],
    );
  }
}

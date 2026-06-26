import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';
import '../utils/extensions.dart';

class RateWidget extends StatelessWidget {
  final double rate;
  const RateWidget({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 26.0,
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEFE7),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Row(
              mainAxisSize: .min,
              mainAxisAlignment: .center,
              children: [
                const Icon(Icons.star_rounded, color: AppColors.starColor),
                const SizedBox(width: 4.0),
                Text(
                  '$rate',
                  style: context.textTheme.bodySmall?.copyWith(fontSize: 14.0),
                ),
              ],
            ),
          
    );
  }
}
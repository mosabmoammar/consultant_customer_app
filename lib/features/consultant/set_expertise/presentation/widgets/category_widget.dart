import 'package:consultant_customer_app/config/theme/app_spacing.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  final void Function()? onTap;

  const CategoryWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Category', style: context.textTheme.displayMedium),

        const SizedBox(height: AppSpacing.s4),

        GestureDetector(
          onTap: onTap,
          child: Container(
            height: AppSpacing.s44,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s16,
              vertical: AppSpacing.s12,
            ),
            decoration: BoxDecoration(
              color: AppColors.lightGray2,
              borderRadius: BorderRadius.circular(AppSpacing.s4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'e.g Category',
                  style: context.textTheme.labelMedium?.copyWith(
                    color: AppColors.darkGray2,
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_rounded, weight: 20.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

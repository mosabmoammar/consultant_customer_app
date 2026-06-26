import 'package:consultant_customer_app/config/theme/app_colors.dart';
import 'package:consultant_customer_app/config/theme/app_spacing.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategorySelectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetSvgString;
  final bool isSelected;
  final VoidCallback onTap;

  const CategorySelectionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.assetSvgString,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s32,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightOrange1 : AppColors.lightGray2,
          borderRadius: BorderRadius.circular(AppSpacing.s4),
          border: Border.all(
            color: isSelected
                ? context.colorScheme.secondary
                : Colors.transparent,
            width: AppSpacing.s2,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: AppSpacing.s56,
              height: AppSpacing.s56,
              padding: const EdgeInsets.all(AppSpacing.s12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSpacing.s12),
                color: Colors.white,
              ),
              child: SvgPicture.asset(
                assetSvgString,
                colorFilter: ColorFilter.mode(
                  isSelected
                      ? context.colorScheme.secondary
                      : AppColors.darkGray2,
                  BlendMode.srcIn,
                ),
                width: AppSpacing.s32,
                height: AppSpacing.s32,
              ),
            ),

            const SizedBox(width: AppSpacing.s16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: context.textTheme.titleMedium),
                  Text(
                    subtitle,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.darkGray4,
                      height: 1.26,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

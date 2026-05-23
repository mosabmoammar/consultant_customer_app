import 'package:consultant_customer_app/config/theme/app_colors.dart';
import 'package:consultant_customer_app/config/theme/app_spacing.dart';
import 'package:consultant_customer_app/core/constants/assets_manager/svg_assets.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:consultant_customer_app/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:consultant_customer_app/features/onboarding/presentation/widgets/continue_button.dart';
import 'package:consultant_customer_app/features/onboarding/presentation/widgets/onboarding_image_section.dart';
import 'package:consultant_customer_app/features/onboarding/presentation/widgets/phone_input_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen: ViewModel failure -> SnackBar
    ref.listen(onboardingProvider.select((value) => value.failure), (
      _,
      failure,
    ) {
      if (failure == null) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(failure.message),
          backgroundColor: context.colorScheme.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
      ref.read(onboardingProvider.notifier).clearFailure();
    });

    // Listen: countries loading failures -> SnackBar
    ref.listen(countriesProvider, (previous, next) {
      next.whenData(
        (result) => result.fold(
          (failure) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(failure.message),
              backgroundColor: context.colorScheme.error,
              behavior: SnackBarBehavior.floating,
            ),
          ),
          (_) {},
        ),
      );
    });

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.only(
                left: AppSpacing.s16,
                right: AppSpacing.s16,
                bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      const SizedBox(height: AppSpacing.s16),

                      // Upper: image carousel
                      SizedBox(
                        height: MediaQuery.heightOf(context) / 1.7,
                        child: const OnboardingImageSection(),
                      ),

                      const SizedBox(height: AppSpacing.s48),

                      // Phone input
                      const PhoneInputRow(),

                      const SizedBox(height: AppSpacing.s12),

                      // Continue button
                      const ContinueButton(),

                      const SizedBox(height: AppSpacing.s16),

                      // ________ or ______
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 0.5,
                            width: MediaQuery.widthOf(context) / 8,
                            color: AppColors.gray,
                          ),

                          const SizedBox(width: AppSpacing.s8),

                          Text('or', style: context.textTheme.titleLarge),

                          const SizedBox(width: AppSpacing.s8),

                          Container(
                            height: 0.5,
                            width: MediaQuery.widthOf(context) / 8,
                            color: AppColors.gray,
                          ),
                        ],
                      ),

                      const SizedBox(height: AppSpacing.s16),

                      // Social login
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Connect With',
                              style: context.textTheme.titleLarge,
                            ),
                            const SizedBox(width: AppSpacing.s8),
                            SvgPicture.asset(SvgAssets.google),
                            const SizedBox(width: AppSpacing.s8),
                            SvgPicture.asset(SvgAssets.facebook),
                            const SizedBox(width: AppSpacing.s8),
                            SvgPicture.asset(SvgAssets.email),
                          ],
                        ),
                      ),

                      const Spacer(),

                      // Terms and privacy
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                            ),
                            children: [
                              const TextSpan(
                                text: 'By continuing you agree to the ',
                              ),
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.grey.shade700,
                                ),
                              ),
                              const TextSpan(text: ' and\n'),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

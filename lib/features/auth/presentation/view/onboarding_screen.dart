import 'package:consultant_customer_app/config/theme/app_colors.dart';
import 'package:consultant_customer_app/config/theme/app_spacing.dart';
import 'package:consultant_customer_app/core/constants/assets_manager/svg_assets.dart';
import 'package:consultant_customer_app/config/routes/routes.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:consultant_customer_app/core/widgets/terms_and_privacy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/main_button.dart';
import '../providers/onboarding_providers.dart';
import '../widgets/onboarding_image_section.dart';
import '../widgets/phone_input_row.dart';

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
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.message),
            backgroundColor: context.colorScheme.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
        ref.read(onboardingProvider.notifier).clearFailure();
      });
    });

    // Listen: countries loading failures -> SnackBar
    ref.listen(countriesProvider, (previous, next) {
      next.whenData(
        (result) => result.fold(
          (failure) => WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!context.mounted) return;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.message),
                backgroundColor: context.colorScheme.error,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }),
          (_) {},
        ),
      );
    });
    final screenHeight = MediaQuery.heightOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 0.0,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.only(
                left: AppSpacing.s16,
                right: AppSpacing.s16,
                bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
              ),
              child: Column(
                children: [
                  const SizedBox(height: AppSpacing.s16),

                  // Upper: image carousel
                  SizedBox(
                    height: screenHeight * 0.50,
                    child: const OnboardingImageSection(),
                  ),

                  const SizedBox(height: AppSpacing.s48),

                  // Phone input
                  const PhoneInputRow(),

                  const SizedBox(height: AppSpacing.s12),

                  // Continue button
                  MainButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.otpScreen);
                    },
                    title: 'Continue',
                  ),

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

                      Text('or', style: context.textTheme.bodyLarge),

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
                    onTap: () {
                      Navigator.pushNamed(context, Routes.signUpMethodsScreen);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Connect With',
                          style: context.textTheme.bodyLarge,
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

                  const SizedBox(height: AppSpacing.s32),

                  // Terms and privacy
                  TermsAndPrivacy(
                    normalColor: Colors.grey.shade500,
                    importantColor: Colors.grey.shade700,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

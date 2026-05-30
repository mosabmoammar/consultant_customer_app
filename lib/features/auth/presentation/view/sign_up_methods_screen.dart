import 'package:consultant_customer_app/config/theme/app_colors.dart';
import 'package:consultant_customer_app/config/theme/app_spacing.dart';
import 'package:consultant_customer_app/core/constants/assets_manager/image_assets.dart';
import 'package:consultant_customer_app/config/routes/routes.dart';
import 'package:consultant_customer_app/core/widgets/auth_method.dart';
import 'package:consultant_customer_app/core/widgets/icon_button_back_arrow.dart';
import 'package:consultant_customer_app/core/widgets/terms_and_privacy.dart';
import 'package:flutter/material.dart';

class SignUpMethodsScreen extends StatelessWidget {
  const SignUpMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const IconButtonBackArrow(color: Colors.white),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 112.0,
                        height: 112.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.s40),
                      AuthMethod(
                        onTap: () {},
                        image: ImageAssets.google,
                        title: 'Continue with google',
                      ),
                      const SizedBox(height: AppSpacing.s24),
                      AuthMethod(
                        onTap: () {},
                        image: ImageAssets.facebook,
                        title: 'Continue with facebook',
                      ),
                      const SizedBox(height: AppSpacing.s24),
                      AuthMethod(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.signInViaEmailScreen);
                        },
                        image: ImageAssets.email,
                        title: 'Sign in with Email',
                      ),
                      const SizedBox(height: AppSpacing.s24),
                      const TermsAndPrivacy(normalColor: Colors.black),
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

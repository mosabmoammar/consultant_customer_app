import 'package:consultant_customer_app/config/theme/app_colors.dart';
import 'package:consultant_customer_app/config/theme/app_spacing.dart';
import 'package:consultant_customer_app/core/constants/assets_manager/image_assets.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:consultant_customer_app/core/widgets/auth_method.dart';
import 'package:consultant_customer_app/core/widgets/custom_password_form_field.dart';
import 'package:consultant_customer_app/core/widgets/custom_text_field.dart';
import 'package:consultant_customer_app/core/widgets/icon_button_back_arrow.dart';
import 'package:consultant_customer_app/core/widgets/main_button.dart';
import 'package:consultant_customer_app/core/widgets/terms_and_privacy.dart';
import 'package:consultant_customer_app/core/widgets/text_title.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignInViaEmailScreen extends StatefulWidget {
  const SignInViaEmailScreen({super.key});

  @override
  State<SignInViaEmailScreen> createState() => _SignInViaEmailScreenState();
}

class _SignInViaEmailScreenState extends State<SignInViaEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const IconButtonBackArrow(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.s16),
                const TextTitle(text: 'SignIn'),
                const SizedBox(height: AppSpacing.s32),
                // Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // TextField
                      CustomTextField(
                        label: 'Email',
                        hintText: 'example@email.com',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      const SizedBox(height: AppSpacing.s16),

                      CustomPasswordFormField(
                        label: 'Password',
                        hintText: 'Min 8 characters',
                      ),

                      const SizedBox(height: AppSpacing.s4),

                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              print('Forgot Password? Tapped');
                            }
                          },
                          child: Text(
                            'Forgot Password?',
                            style: context.textTheme.displayMedium?.copyWith(
                              color: AppColors.lightRed1,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),

                      const SizedBox(height: AppSpacing.s32),

                      MainButton(onPressed: () {}, title: 'Continue'),

                      const SizedBox(height: AppSpacing.s24),

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
                      AuthMethod(
                        image: ImageAssets.google,
                        title: 'Continue with Google',
                        color: AppColors.lightGray2,
                        alignment: Alignment.center,
                        onTap: () {},
                      ),
                      const SizedBox(height: AppSpacing.s16),
                      AuthMethod(
                        image: ImageAssets.facebook,
                        title: 'Continue with Google',
                        color: AppColors.lightGray2,
                        alignment: Alignment.center,
                        onTap: () {},
                      ),

                      const SizedBox(height: AppSpacing.s24),

                      const TermsAndPrivacy(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

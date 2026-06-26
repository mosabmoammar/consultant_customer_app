import 'package:consultant_customer_app/config/routes/routes.dart';
import 'package:consultant_customer_app/core/widgets/main_button.dart';
import 'package:consultant_customer_app/core/widgets/text_title.dart';
import 'package:consultant_customer_app/features/auth/presentation/widgets/otp_text_field.dart';
import 'package:consultant_customer_app/features/auth/presentation/widgets/otp_timer_widget.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/app_spacing.dart';
import '../../../../core/widgets/icon_button_back_arrow.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String dialNumber = '+123456789';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const IconButtonBackArrow(),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

            return Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.s16,
                    0,
                    AppSpacing.s16,
                    AppSpacing.s24 + AppSpacing.s44 + AppSpacing.s24,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: AppSpacing.s16),

                      TextTitle(
                        text:
                            'Enter your OTP sent to your mobile number $dialNumber',
                      ),

                      const SizedBox(height: AppSpacing.s24),

                      // OTP Fields
                      const OtpTextField(),

                      const SizedBox(height: AppSpacing.s8),

                      // OTP resend code timer
                      const Align(
                        alignment: Alignment.centerRight,
                        child: OtpTimerWidget(),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppSpacing.s16,
                      0,
                      AppSpacing.s16,
                      AppSpacing.s16 + bottomInset,
                    ),
                    child: MainButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.userCategorySelectionScreen,
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

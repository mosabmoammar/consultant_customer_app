import 'package:consultant_customer_app/config/routes/routes.dart';
import 'package:consultant_customer_app/features/auth/presentation/auth_methods/view/otp_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/onboarding/view/onboarding_screen.dart';
import '../../features/auth/presentation/auth_methods/view/sign_in_via_email_screen.dart';
import '../../features/auth/presentation/auth_methods/view/sign_up_methods_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.signUpMethodsScreen:
        return MaterialPageRoute(builder: (_) => const SignUpMethodsScreen());
      case Routes.signInViaEmailScreen:
        return MaterialPageRoute(builder: (_) => const SignInViaEmailScreen());
      case Routes.otpScreen:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}

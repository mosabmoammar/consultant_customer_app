import 'package:consultant_customer_app/config/routes/routes.dart';
import 'package:consultant_customer_app/features/auth/presentation/view/otp_screen.dart';
import 'package:consultant_customer_app/features/personal_information/presentation/view/personal_info_screen.dart';
import 'package:flutter/material.dart';

import '../../core/constants/enum/user_category.dart';
import '../../features/auth/presentation/view/onboarding_screen.dart';
import '../../features/auth/presentation/view/sign_in_via_email_screen.dart';
import '../../features/auth/presentation/view/sign_up_methods_screen.dart';
import '../../features/customer/select_interest/presentation/view/select_interest_screen.dart';
import '../../features/user_category_selection/presentation/view/user_category_selection_screen.dart';

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
      case Routes.userCategorySelectionScreen:
        return MaterialPageRoute(
          builder: (_) => const UserCategorySelectionScreen(),
        );
      case Routes.personalInfoScreen:
        final category = settings.arguments as UserCategory?;
        return MaterialPageRoute(
          builder: (_) =>
              PersonalInfoScreen(category: category ?? UserCategory.customer),
        );
      case Routes.selectInterestScreen:
        return MaterialPageRoute(builder: (_) => SelectInterestScreen());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}

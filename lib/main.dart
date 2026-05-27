import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:consultant_customer_app/config/injection/injection_container.dart';
import 'package:consultant_customer_app/config/routes/app_router.dart';
import 'package:consultant_customer_app/config/theme/app_theme.dart';
import 'package:consultant_customer_app/config/routes/routes.dart';

import 'features/auth/presentation/auth_methods/view/sign_up_methods_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  await setupDI();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consultant App',
      theme: AppTheme.light,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: Routes.onboardingScreen,
      home: const SignUpMethodsScreen(),
    );
  }
}

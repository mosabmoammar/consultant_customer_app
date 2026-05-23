import 'package:consultant_customer_app/config/theme/app_spacing.dart';
import 'package:consultant_customer_app/core/utils/extensions.dart';
import 'package:consultant_customer_app/features/onboarding/presentation/providers/onboarding_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContinueButton extends ConsumerWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canContinue = ref.watch(
      onboardingProvider.select((value) => value.canContinue),
    );
    return SizedBox(
      width: double.infinity,
      height: AppSpacing.s44,
      child: ElevatedButton(
        onPressed: canContinue
            ? () => ref.read(onboardingProvider.notifier).onContinue()
            : null,
        child: Text('Continue', style: context.textTheme.titleLarge?.copyWith(color: Colors.white)),
      ),
    );
  }
}

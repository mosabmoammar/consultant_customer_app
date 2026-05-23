import 'package:consultant_customer_app/features/onboarding/domain/entities/country_entity.dart';
import 'package:consultant_customer_app/features/onboarding/presentation/providers/onboarding_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingNotifier extends Notifier<OnboardingState> {
  @override
  OnboardingState build() => const OnboardingState();

  void setPage(int index) => state = state.copyWith(currentPage: index);

  void selectedCountry(CountryEntity country) =>
      state = state.copyWith(selectedCountry: country);

  void setPhoneNumber(String phoneNumber) =>
      state = state.copyWith(phoneNumber: phoneNumber);

  void clearFailure() => state = state.clearFailure();

  void onContinue() {
    if (!state.canContinue) return;
    final dialCode = state.selectedCountry?.dialCode ?? '';
    final fullNumber = '$dialCode${state.phoneNumber}';

    if (kDebugMode) {
      print('Phone Number: $fullNumber');
    }

    // TODO: navigation to OTP screen via ref.read(routerProvider)
  }
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/country_entity.dart';
import 'onboarding_state.dart';

class OnboardingNotifier extends Notifier<OnboardingState> {
  Timer? _autoScrollTimer;

  @override
  OnboardingState build() {
    ref.onDispose(_stopAutoScroll);
    return const OnboardingState();
  }

  // Page Navigation
  void onVirtualPageChanged(int virtualPage, int itemCount) {
    final real = state.realIndexFrom(virtualPage, itemCount);
    state = state.copyWith(currentVirtualPage: virtualPage, currentPage: real);
  }

  int get nextVirtualPage => state.currentVirtualPage + 1;

  // Auto-scroll
  void startAutoScroll(void Function() onTick) {
    _stopAutoScroll();
    _autoScrollTimer = Timer.periodic(
      const Duration(seconds: 3),
      (_) => onTick(),
    );
  }

  void _stopAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = null;
  }

  void pauseAutoScroll() => _stopAutoScroll();

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

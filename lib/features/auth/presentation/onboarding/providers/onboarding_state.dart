// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:consultant_customer_app/core/errors/failures.dart';

import '../../../domain/onboarding/entities/country_entity.dart';

class OnboardingState {
  // Virtual page count
  static const int virtualPageCount = 30000;
  static const int initialVirtualPage = virtualPageCount ~/ 2;

  final int currentPage;
  final int currentVirtualPage;
  final CountryEntity? selectedCountry;
  final String phoneNumber;
  final Failure? failure;

  const OnboardingState({
    this.currentPage = 0,
    this.currentVirtualPage = initialVirtualPage,
    this.selectedCountry,
    this.phoneNumber = '',
    this.failure,
  });

  OnboardingState copyWith({
    int? currentPage,
    int? currentVirtualPage,
    CountryEntity? selectedCountry,
    String? phoneNumber,
    Failure? failure,
  }) => OnboardingState(
    currentPage: currentPage ?? this.currentPage,
    currentVirtualPage: currentVirtualPage ?? this.currentVirtualPage,
    selectedCountry: selectedCountry ?? this.selectedCountry,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    failure: failure ?? this.failure,
  );

  OnboardingState clearFailure() => OnboardingState(
    currentPage: currentPage,
    currentVirtualPage: currentVirtualPage,
    selectedCountry: selectedCountry,
    phoneNumber: phoneNumber,
  );

  bool get canContinue => phoneNumber.trim().isNotEmpty;

  int realIndexFrom(int virtualPage, int itemCount) =>
      itemCount == 0 ? 0 : virtualPage % itemCount;
}

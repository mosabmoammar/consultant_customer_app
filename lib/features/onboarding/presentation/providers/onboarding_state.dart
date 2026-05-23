// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:consultant_customer_app/core/errors/failures.dart';
import 'package:consultant_customer_app/features/onboarding/domain/entities/country_entity.dart';

class OnboardingState {
  final int currentPage;
  final CountryEntity? selectedCountry;
  final String phoneNumber;
  final Failure? failure;

  const OnboardingState({
    this.currentPage = 0,
    this.selectedCountry,
    this.phoneNumber = '',
    this.failure,
  });

  OnboardingState copyWith({
    int? currentPage,
    CountryEntity? selectedCountry,
    String? phoneNumber,
    Failure? failure,
  }) => OnboardingState(
    currentPage: currentPage ?? this.currentPage,
    selectedCountry: selectedCountry ?? this.selectedCountry,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    failure: failure ?? this.failure,
  );

  OnboardingState clearFailure() => OnboardingState(
    currentPage: currentPage,
    selectedCountry: selectedCountry,
    phoneNumber: phoneNumber,
  );

  bool get canContinue => phoneNumber.trim().isNotEmpty;
}

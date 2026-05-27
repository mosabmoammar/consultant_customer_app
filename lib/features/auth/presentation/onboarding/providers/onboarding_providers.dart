import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:consultant_customer_app/config/injection/injection_container.dart';
import 'package:consultant_customer_app/core/errors/failures.dart';
import 'package:consultant_customer_app/core/use_cases/use_case.dart';

import '../../../domain/onboarding/entities/country_entity.dart';
import '../../../domain/onboarding/entities/onboarding_item_entity.dart';
import '../../../domain/onboarding/use_cases/get_countries_use_case.dart';
import '../../../domain/onboarding/use_cases/get_onboarding_items_use_case.dart';
import 'onboarding_notifier.dart';
import 'onboarding_state.dart';

final onboardingProvider =
    NotifierProvider<OnboardingNotifier, OnboardingState>(
      OnboardingNotifier.new,
    );

// Onboarding Slides
final onboardingItemsProvider =
    Provider<Either<Failure, List<OnboardingItemEntity>>>(
      (_) => sl<GetOnboardingItemsUseCase>().call(const NoParams()),
    );

// Countries
final countriesProvider = FutureProvider<Either<Failure, List<CountryEntity>>>((
  ref,
) async {
  final result = await sl<GetCountriesUseCase>().call(const NoParams());
  result.fold((_) {}, (countries) {
    if (countries.isNotEmpty) {
      ref.read(onboardingProvider.notifier).selectedCountry(countries.first);
    }
  });
  return result;
});

import 'package:get_it/get_it.dart';

import '../../features/auth/data/onboarding/local/onboarding_local_data_source.dart';
import '../../features/auth/data/onboarding/mappers/country_mapper.dart';
import '../../features/auth/data/onboarding/mappers/onboarding_item_mapper.dart';
import '../../features/auth/data/onboarding/repositories/country_repository_impl.dart';
import '../../features/auth/data/onboarding/repositories/onboarding_repository_impl.dart';
import '../../features/auth/domain/onboarding/repositories/country_repository.dart';
import '../../features/auth/domain/onboarding/repositories/onboarding_repository.dart';
import '../../features/auth/domain/onboarding/use_cases/get_countries_use_case.dart';
import '../../features/auth/domain/onboarding/use_cases/get_onboarding_items_use_case.dart';


final sl = GetIt.instance;

Future<void> setupDI() async {
  // DataSource
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => const OnboardingLocalDataSourceImpl(),
  );

  // Mapper
  sl.registerLazySingleton<CountryMapper>(() => const CountryMapper());
  sl.registerLazySingleton<OnboardingItemMapper>(
    () => const OnboardingItemMapper(),
  );

  // Repository
  sl.registerLazySingleton<CountryRepository>(
    () => CountryRepositoryImpl(mapper: sl<CountryMapper>()),
  );
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(
      dataSource: sl<OnboardingLocalDataSource>(),
      mapper: sl<OnboardingItemMapper>(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(
    () => GetCountriesUseCase(repository: sl<CountryRepository>()),
  );

  sl.registerLazySingleton(
    () => GetOnboardingItemsUseCase(repository: sl<OnboardingRepository>()),
  );
}

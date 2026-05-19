import 'package:consultant_customer_app/core/errors/failures.dart';
import 'package:consultant_customer_app/features/onboarding/domain/repositories/country_repository.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/use_case.dart';
import '../entities/country_entity.dart';

class GetCountriesUseCase implements UseCase<List<CountryEntity>, NoParams> {
  final CountryRepository repository;

  GetCountriesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<CountryEntity>>> call(NoParams params) {
    return repository.getCountries();
  }
}

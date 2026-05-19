import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/country_entity.dart';

abstract class CountryRepository {
  Future<Either<Failure, List<CountryEntity>>> getCountries();
}

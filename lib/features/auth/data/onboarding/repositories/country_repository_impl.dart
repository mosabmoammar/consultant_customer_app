import 'dart:convert';

import 'package:consultant_customer_app/core/constants/assets_manager/json_assets.dart';
import 'package:consultant_customer_app/core/errors/exceptions.dart';
import 'package:consultant_customer_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../../../domain/onboarding/entities/country_entity.dart';
import '../../../domain/onboarding/repositories/country_repository.dart';
import '../mappers/country_mapper.dart';
import '../models/country_model.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryMapper mapper;

  CountryRepositoryImpl({required this.mapper});
  @override
  Future<Either<Failure, List<CountryEntity>>> getCountries() async {
    try {
      final raw = await rootBundle.loadString(JsonAssets.countries);
      final list = json.decode(raw) as List<dynamic>;
      final models = list
          .map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList();

      final entities = mapper.toEntityList(models);
      return Right(entities);
    } on AssetException catch (e) {
      return Left(AssetFailure(message: e.message));
    } on FormatException catch (e) {
      return Left(ParseFailure(message: e.message));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}

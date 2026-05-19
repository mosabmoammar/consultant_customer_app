abstract class Failure {
  final String message;

  const Failure({required this.message});
}

class ServerFailure extends Failure {
  const ServerFailure({super.message = 'A server error occurred.'});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message = 'A cache error occurred.'});
}

class AssetFailure extends Failure {
  const AssetFailure({super.message = 'Failed to load local asset.'});
}

class NetworkFailure extends Failure {
  NetworkFailure({super.message = 'No internet connection.'});
}

class ParseFailure extends Failure {
  const ParseFailure({super.message = 'Failed to parse data.'});
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({super.message = 'Unauthorized access.'});
}

class UnknownFailure extends Failure {
  const UnknownFailure({super.message = 'An unknown error occurred.'});
}

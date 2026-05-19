class ServerException implements Exception {
  final String message;
  const ServerException({this.message = 'A server error occurred.'});
}

class CacheException implements Exception {
  final String message;
  const CacheException({this.message = 'A cache error occurred.'});
}

class AssetException implements Exception {
  final String message;
  const AssetException({this.message = 'Failed to load local asset.'});
}

class NetworkException implements Exception {
  final String message;
  const NetworkException({this.message = 'No internet connection.'});
}

class ParseException implements Exception {
  final String message;
  const ParseException({this.message = 'Failed to parse data.'});
}

class UnauthorizedException implements Exception {
  final String message;
  const UnauthorizedException({this.message = 'Unauthorized access.'});
}

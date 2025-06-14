class AppException implements Exception {
  final String message;

  final String? prefix;

  AppException([this.message = '', this.prefix]);
}

class ServerException implements Exception {
  ServerException([String message = '']);
}

class UnauthorizedException implements Exception {}

class ResourceNotFoundException extends ServerException {
  ResourceNotFoundException([super.message = 'Not found']);
}

class NetworkException extends AppException {
  NetworkException([String message = '']) : super(message, 'Network');
}

class NoInternetConnectionException extends NetworkException {
  NoInternetConnectionException([super.message = 'No internet connection']);
}

class TimeoutException extends NetworkException {
  TimeoutException([super.message = 'Request timeout']);
}

class CacheException extends AppException {
  CacheException([String message = '']) : super(message, 'Cache');
}

class CacheMissException extends CacheException {
  CacheMissException([super.message = 'Cache miss']);
}

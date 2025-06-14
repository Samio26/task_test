import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error']);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Unauthorized']);
}

class ResourceNotFoundFailure extends Failure {
  const ResourceNotFoundFailure([super.message = 'Not found']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Network error']);
}

class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure([super.message = 'No internet connection']);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure([super.message = 'Request timeout']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache error']);
}

class CacheMissFailure extends Failure {
  const CacheMissFailure([super.message = 'Cache miss']);
}

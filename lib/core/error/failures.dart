import 'exceptions.dart';

sealed class Failure {
  const Failure(this.message);

  final String message;
}

final class ConfigurationFailure extends Failure {
  const ConfigurationFailure(super.message);
}

final class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

final class TimeoutFailure extends Failure {
  const TimeoutFailure(super.message);
}

final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(super.message);
}

final class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

final class InvalidResponseFailure extends Failure {
  const InvalidResponseFailure(super.message);
}

final class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}

Failure failureFrom(Object error) {
  return switch (error) {
    ConfigurationException() => ConfigurationFailure(error.message),
    NetworkException() => NetworkFailure(error.message),
    TimeoutRequestException() => TimeoutFailure(error.message),
    UnauthorizedException() => UnauthorizedFailure(error.message),
    ServerException() => ServerFailure(error.message),
    InvalidResponseException() => InvalidResponseFailure(error.message),
    _ => const UnknownFailure('حدث خطأ أثناء الاتصال بخدمة التتبع.'),
  };
}

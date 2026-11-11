/// Exceptions thrown by the network layer. Widgets never see these directly;
/// cubits map them to [Failure] messages.
sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => message;
}

final class ConfigurationException extends AppException {
  const ConfigurationException(super.message);
}

final class NetworkException extends AppException {
  const NetworkException(super.message);
}

final class TimeoutRequestException extends AppException {
  const TimeoutRequestException(super.message);
}

final class UnauthorizedException extends AppException {
  const UnauthorizedException(super.message);
}

final class ServerException extends AppException {
  const ServerException(super.message);
}

final class InvalidResponseException extends AppException {
  const InvalidResponseException(super.message);
}

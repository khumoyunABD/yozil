// lib/core/errors/exceptions.dart

class ServerException implements Exception {}

class InvalidCredentialsException implements Exception {}

class EmailAlreadyInUseException implements Exception {}

// Add this new exception class if not already defined
class PhoneNumberAlreadyInUseException implements Exception {}

// Add this new exception class if not already defined
class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);
}

// Add any new failure types needed
// class PhoneNumberAlreadyInUseFailure extends Failure {
//   @override
//   String get message => 'Phone number is already in use';
// }

// class ValidationFailure extends Failure {
//   final String validationMessage;

//   ValidationFailure(this.validationMessage);

//   @override
//   String get message => validationMessage;
// }

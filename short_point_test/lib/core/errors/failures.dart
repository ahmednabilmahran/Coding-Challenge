/// A base [Failure] class for managing errors.
///
/// Contains a [String] error message to be used throughout the application.
class Failure {
  /// Default constructor takes an error message.
  const Failure(this.errMessage);

  /// The error message.
  final String errMessage;
}

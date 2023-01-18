library open_earable;

abstract class OpenEarableException implements Exception {
  const OpenEarableException([this.message]);

  final String? message;

  @override
  String toString() {
    String result = 'OpenEarableException';
    if (message is String) return '$result: $message';
    return result;
  }
}

class OpenEarableSetupException extends OpenEarableException {
  const OpenEarableSetupException([String? message]) : super(message);
}

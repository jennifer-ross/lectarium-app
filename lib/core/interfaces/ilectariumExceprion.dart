abstract class ILectariumException implements Exception {
  const ILectariumException([this.message]);

  final String? message;

  @override
  String toString() {
    String result = 'ILectariumException';
    if (message is String) return '$result: $message';
    return result;
  }
}

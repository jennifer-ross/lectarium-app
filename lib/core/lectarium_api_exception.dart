import 'package:lectarium/core/interfaces/ilectariumExceprion.dart';

class LectariumApiException extends ILectariumException {
  static const int clientEmpty = 0;
  static const int unknownMethod = 1;
  static const int httpErrorCode = 2;
  static const int securityError = 3;

  const LectariumApiException([String? message, int? code])
      : super("LectariumApiException: $message. Code error $code");
}

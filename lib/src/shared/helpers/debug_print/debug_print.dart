import 'package:flutter/foundation.dart';

void debugPrintHelper(String value) {
  if (kDebugMode) {
    debugPrint(value);
  }
}

import 'package:flutter/foundation.dart';

class Debug {
  static void mLog(String message) {
    if (kDebugMode) {
      print('🐛🐛🐛🐛 [DEBUG MESSAGE]: $message 🐛🐛🐛🐛');
    }
  }

  static void successLog({required String from, required String message}) {
    if (kDebugMode) {
      print('🐛🐛[$from]: $message');
    }
  }

  static void errorLog({required String from, required String message}) {
    if (kDebugMode) {
      print('🐞🐞[$from]: $message');
    }
  }
}

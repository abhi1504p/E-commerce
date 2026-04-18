import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

enum LogLevel { debug, info, warning, error }

class AppLogger {
  static bool _enabled = true; // turn off in production if needed

  static void enableLogs(bool value) {
    _enabled = value;
  }

  static void _log(
      String message, {
        LogLevel level = LogLevel.debug,
        String tag = "APP",
        Object? error,
        StackTrace? stackTrace,
      }) {
    if (!_enabled) return;

    final time = DateTime.now().toIso8601String();
    final levelStr = level.name.toUpperCase();

    final formattedMessage =
        "[$time] [$levelStr] [$tag] $message";

    if (kDebugMode) {
      // Console print (clean readable)
      debugPrint(formattedMessage);
    }

    // Developer log (visible in DevTools)
    developer.log(
      message,
      name: tag,
      error: error,
      stackTrace: stackTrace,
      level: _mapLogLevel(level),
    );
  }

  static int _mapLogLevel(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return 500;
      case LogLevel.info:
        return 800;
      case LogLevel.warning:
        return 900;
      case LogLevel.error:
        return 1000;
    }
  }

  // ===== Public methods =====

  static void d(String message, {String tag = "DEBUG"}) {
    _log(message, level: LogLevel.debug, tag: tag);
  }

  static void i(String message, {String tag = "INFO"}) {
    _log(message, level: LogLevel.info, tag: tag);
  }

  static void w(String message, {String tag = "WARNING"}) {
    _log(message, level: LogLevel.warning, tag: tag);
  }

  static void e(
      String message, {
        String tag = "ERROR",
        Object? error,
        StackTrace? stackTrace,
      }) {
    _log(
      message,
      level: LogLevel.error,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
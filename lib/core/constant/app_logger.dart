import 'package:flutter/foundation.dart';

enum LogLevel { debug, info, warning, error }

class AppLogger {
  static bool _enabled = true;

  static void enableLogs(bool value) {
    _enabled = value;
  }

  // ===== CORE LOGGER =====
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

    final coloredMessage = _applyColor(formattedMessage, level);

    if (kDebugMode) {
      debugPrint(coloredMessage);
    }

    // Optional: show stacktrace only for errors
    if (level == LogLevel.error && stackTrace != null) {
      debugPrint(stackTrace.toString());
    }
  }

  // ===== COLOR HANDLER =====
  static String _applyColor(String message, LogLevel level) {
    const reset = '\x1B[0m';

    switch (level) {
      case LogLevel.debug:
        return '\x1B[37m$message$reset'; // White
      case LogLevel.info:
        return '\x1B[34m$message$reset'; // Blue
      case LogLevel.warning:
        return '\x1B[33m$message$reset'; // Yellow
      case LogLevel.error:
        return '\x1B[31m$message$reset'; // Red
    }
  }

  // ===== PUBLIC METHODS =====

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
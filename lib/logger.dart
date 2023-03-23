import "package:flutter/foundation.dart";
import 'package:intl/intl.dart';
import '../locator.dart';
import 'app_config.dart';
import 'environment.dart';


configureLogger() {
  if (!kReleaseMode ||
      locator<AppConfigService>().appEnvironment != AppEnvironment.PRODUCTION) {
    // Add standard log output only on debug builds
    Logger.addClient(DebugLoggerClient());
  } else {
    // Pass all uncaught errors from the framework to Crashlytics.
//    FlutterError.onError = Crashlytics.instance.recordFlutterError;
    Logger.addClient(CrashlyticsLoggerClient());
  }
}

class Logger {
  static final _clients = <LoggerClient>[];

  /// Debug level logs
  static d(
      String message, {
        dynamic e,
        StackTrace? s,
      }) {
    for (var c in _clients) {
      c.onLog(
        level: LogLevel.debug,
        message: message,
        e: e,
        s: s,
      );
    }
  }

  // Warning level logs
  static w(
      String message, {
        dynamic e,
        StackTrace? s,
      }) {
    for (var c in _clients) {
      c.onLog(
        level: LogLevel.warning,
        message: message,
        e: e,
        s: s,
      );
    }
  }

  /// Error level logs
  /// Requires a current StackTrace to report correctly on Crashlytics
  /// Always reports as non-fatal to Crashlytics
  static e(
      String message, {
        dynamic e,
        required StackTrace s,
      }) {
    for (var c in _clients) {
      c.onLog(
        level: LogLevel.error,
        message: message,
        e: e,
        s: s,
      );
    }
  }

  static addClient(LoggerClient client) {
    _clients.add(client);
  }
}

enum LogLevel { debug, warning, error }

abstract class LoggerClient {
  onLog({
    required LogLevel level,
    required String message,
    required dynamic e,
    StackTrace? s,
  });
}

/// Debug logger that just prints to console
class DebugLoggerClient implements LoggerClient {
  static final dateFormat = DateFormat("HH:mm a");

  String _timestamp() {
    return dateFormat.format(DateTime.now());
  }

  @override
  onLog({
    required LogLevel level,
    required String message,
    required dynamic e,
    StackTrace? s,
  }) {
    String tag = "";

    switch (level) {
      case LogLevel.debug:
        tag = "[DEBUG]";
        debugPrint("${_timestamp()} [DEBUG]  $message");

        if (e != null) {
          debugPrint(e.toString());
          debugPrint(s?.toString() ?? StackTrace.current.toString());
        }

        break;
      case LogLevel.warning:
        tag = "[WARNING]";

        debugPrint("${_timestamp()} [WARNING]  $message");
        if (e != null) {
          debugPrint(e.toString());
          debugPrint(s?.toString() ?? StackTrace.current.toString());
        }
        break;
      case LogLevel.error:
        tag = "[ERROR]";

        debugPrint("${_timestamp()} [ERROR]  $message");
        if (e != null) {
          debugPrint(e.toString());
        }
        // Errors always show a StackTrace
        debugPrint(s?.toString() ?? StackTrace.current.toString());
        break;
    }
  }
}

/// Logger that reports to Crashlytics/Firebase
class CrashlyticsLoggerClient implements LoggerClient {
  @override
  onLog({
    required LogLevel level,
    required String message,
    required dynamic e,
    StackTrace? s,
  }) {
    // final instance = Crashlytics.instance;
    //  switch (level) {
    //    case LogLevel.debug:
    //      break;
    //    case LogLevel.warning:
    //      instance.log("[WARNING] $message");
    //      if (e != null) {
    //        instance.log(e.toString());
    //        instance.log(s ?? StackTrace.current.toString());
    //      }
    //      break;
    //    case LogLevel.error:
    //      instance.log("[ERROR] $message");
    //      // Always report a non-fatal for errors
    //      if (e != null) {
    //        instance.recordError(e, s);
    //      } else {
    //        instance.recordError(Exception(message), s);
    //      }
    //      break;
    //  }
  }
}

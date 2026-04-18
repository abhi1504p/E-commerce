import 'package:flutter/material.dart';

enum SnackType { success, error, warning, info }

class AppSnackbar {
  static void show(
      BuildContext context, {
        required String message,
        SnackType type = SnackType.info,
        String? actionLabel,
        VoidCallback? onAction,
        Duration duration = const Duration(seconds: 3),
      }) {
    final config = _getConfig(type);

    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(config.icon, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: config.color,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      duration: duration,
      action: actionLabel != null
          ? SnackBarAction(
        label: actionLabel,
        textColor: Colors.white,
        onPressed: onAction ?? () {},
      )
          : null,
    );

    final messenger = ScaffoldMessenger.of(context);

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  // Helper for styles
  static _SnackConfig _getConfig(SnackType type) {
    switch (type) {
      case SnackType.success:
        return _SnackConfig(Icons.check_circle, Colors.green);
      case SnackType.error:
        return _SnackConfig(Icons.error, Colors.red);
      case SnackType.warning:
        return _SnackConfig(Icons.warning, Colors.orange);
      case SnackType.info:
        return _SnackConfig(Icons.info, Colors.blue);
    }
  }
}

class _SnackConfig {
  final IconData icon;
  final Color color;

  _SnackConfig(this.icon, this.color);
}
import 'package:esewa_flutter_module/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  AppLocalizations get l10n => AppLocalizations.of(this)!;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  Future<void> showAlertDialog({
    required String title,
    required String message,
    String? confirmText = 'Ok',
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return showDialog(
      context: this,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          if (cancelText != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onCancel?.call();
              },
              child: Text(cancelText),
            ),
          TextButton(
            child: Text(
              confirmText ?? 'Ok',
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              // Dismiss the dialog when the button is pressed
              onConfirm?.call();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

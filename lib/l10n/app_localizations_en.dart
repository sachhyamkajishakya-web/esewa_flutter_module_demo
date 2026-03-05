// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get error => 'Error';

  @override
  String get ok => 'Ok';

  @override
  String ratings(String rating) {
    return '$rating Ratings';
  }

  @override
  String reviews(int reviews) {
    return '$reviews Reviews';
  }
}

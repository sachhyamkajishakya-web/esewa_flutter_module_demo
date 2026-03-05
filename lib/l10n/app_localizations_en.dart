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
  String sold(int sold) {
    return '$sold Sold';
  }

  @override
  String price(String price) {
    return '\$ $price';
  }

  @override
  String get pay => 'Pay';

  @override
  String get totalPrice => 'Total Price';

  @override
  String get productCategory => 'Product Category';

  @override
  String get productDescription => 'Product Description';
}

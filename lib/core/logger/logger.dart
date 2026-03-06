import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    errorMethodCount: 5,
    lineLength: 200,
    colors: true,
    printEmojis: true,
  ),
);

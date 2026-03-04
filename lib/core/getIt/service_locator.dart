import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
// // The generated file will be available after running the build_runner command
import 'service_locator.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() => getIt.init();

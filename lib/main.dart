import 'package:esewa_flutter_module/core/getIt/service_locator.dart';
import 'package:esewa_flutter_module/core/helper/android_method_channel_helper.dart';
import 'package:esewa_flutter_module/core/theme/dark_theme.dart';
import 'package:esewa_flutter_module/core/theme/light_theme.dart';
import 'package:esewa_flutter_module/l10n/app_localizations.dart';
import 'package:esewa_flutter_module/presentation/list_view/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidMethodChannelHelper.init();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: LightTheme.lightTheme,
      darkTheme: DartTheme.darkTheme,
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ProductListScreen(),
    );
  }
}

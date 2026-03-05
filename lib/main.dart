import 'package:esewa_flutter_module/core/getIt/service_locator.dart';
import 'package:esewa_flutter_module/core/theme/dark_theme.dart';
import 'package:esewa_flutter_module/core/theme/light_theme.dart';
import 'package:esewa_flutter_module/presentation/list_view/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: const ProductListScreen(),
    );
  }
}

import 'dart:io';

import 'package:esewa_flutter_module/core/extension/context_extension.dart';
import 'package:esewa_flutter_module/core/getIt/service_locator.dart';
import 'package:esewa_flutter_module/core/widgets/custom_scaffold.dart';
import 'package:esewa_flutter_module/presentation/list_view/cubit/product_list_cubit/product_list_cubit.dart';
import 'package:esewa_flutter_module/presentation/list_view/widgets/item_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListCubit>(
      create: (_) => getIt<ProductListCubit>()..fetchProducts(),
      child: ProductListScreenScaffold(),
    );
  }
}

class ProductListScreenScaffold extends StatefulWidget {
  const ProductListScreenScaffold({super.key});

  @override
  State<ProductListScreenScaffold> createState() =>
      _ProductListScreenScaffoldState();
}

class _ProductListScreenScaffoldState extends State<ProductListScreenScaffold> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (Platform.isIOS) {
        await const MethodChannel(
          'com.example.esewa_ios/config',
        ).invokeMethod('flutterReady');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: CustomScaffold(
        child: BlocConsumer<ProductListCubit, ProductListState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              error: (errorMessage) {
                // show all error in a dialog box
                return context.showAlertDialog(
                  title: context.l10n.error,
                  message: errorMessage,
                );
              },
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => Center(child: CircularProgressIndicator()),
              orElse: () => const SizedBox.shrink(),
              success: (products) => ItemGridView(products: products),
            );
          },
        ),
      ),
    );
  }
}

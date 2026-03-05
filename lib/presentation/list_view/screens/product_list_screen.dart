import 'package:esewa_flutter_module/core/getIt/service_locator.dart';
import 'package:esewa_flutter_module/presentation/list_view/cubit/product_list_cubit/product_list_cubit.dart';
import 'package:esewa_flutter_module/presentation/list_view/widgets/item_grid_view.dart';
import 'package:flutter/material.dart';
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

class ProductListScreenScaffold extends StatelessWidget {
  const ProductListScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocConsumer<ProductListCubit, ProductListState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              error: (error) {
                // show all error in a dialog box
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Center(child: Text("Error")),
                      content: Text(error),
                      actions: [
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            // Dismiss the dialog when the button is pressed
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
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

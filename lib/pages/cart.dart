import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:yashopping/controllers/root_navigation_controller.dart';

import '../data/cart.dart';
import '../widgets/product_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();
    final appLocalization = AppLocalizations.of(context)!;
    return Scaffold(
      body: cart.count == 0
          ? Center(
              child: Text(appLocalization.cart_empty),
            )
          : ListView.builder(
              itemCount: cart.count,
              itemBuilder: (context, index) => ProductItem(
                productInfo: cart.item(index),
                onDelete: () async {
                  final controller = context.read<RootNavigationController>();
                  final confirmed = await controller.showConfirmationDialog(
                    appLocalization.delete_from_cart,
                    appLocalization.delete_from_cart_confirmation,
                    appLocalization.ok,
                    appLocalization.cancel,
                  );
                  if (confirmed == true) {
                    cart.removeFromCart(cart.item(index));
                  }
                },
              ),
            ),
    );
  }
}

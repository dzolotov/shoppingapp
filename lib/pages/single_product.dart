import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/cart.dart';
import '../mocks/products.dart';
import '../models/product.dart';
import '../theme/theme.dart';

class SingleProductPage extends StatefulWidget {
  final int id;

  const SingleProductPage({required this.id, super.key});

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  ProductInfo? productInfo;

  @override
  void initState() {
    super.initState();
    try {
      productInfo = predefinedProducts.firstWhere((e) => e.id == widget.id);
    } catch (e) {
      productInfo = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
            productInfo?.title[Localizations.localeOf(context).languageCode]! ??
                ''),
      ),
      body: productInfo == null
          ? Center(
              child: Text('Product not found'),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Card(
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/products/${productInfo!.image}',
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                          Theme.of(context)
                                  .extension<YaShoppingTheme>()
                                  ?.productDescriptionPadding ??
                              0.0,
                        ),
                        child: Text(
                          productInfo!.description[
                              Localizations.localeOf(context).languageCode]!,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (cart.isContains(productInfo!)) {
                      cart.removeFromCart(productInfo!);
                    } else {
                      cart.addToCart(productInfo!);
                    }
                  },
                  child: cart.isContains(productInfo!)
                      ? Text('Удалить из корзины')
                      : Text('Добавить в корзину'),
                ),
              ],
            ),
    );
  }
}

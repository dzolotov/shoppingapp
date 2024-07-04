import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:yashopping/controllers/nested_navigation_controller.dart';
import 'package:yashopping/controllers/root_navigation_controller.dart';
import 'package:yashopping/pages/landing.dart';

import 'data/cart.dart';
import 'data/language.dart';
import 'mocks/authorized_user.dart';
import 'pages/cart.dart';
import 'pages/nested_navigation.dart';
import 'pages/profile_nested_navigation.dart';
import 'theme/theme.dart';

//структура адреса /locale/path, например /ru/profile

class NavigationState extends ChangeNotifier {
  bool isLanding = true;

  SupportedLanguages _language = SupportedLanguages.en;

  SupportedLanguages get language => _language;

  String get flag => language == SupportedLanguages.en ? 'us' : language.name;

  void switchLanguage() {
    int nextIndex = (_language.index + 1) % SupportedLanguages.values.length;
    _language = SupportedLanguages.values[nextIndex];
    notifyListeners();
  }

  int tabIndex = 0; //0 - список товаров, 1 - корзина, 2 - профиль
  int? category; //если null - в списке категорий
  int? product; //если null - в списке товаров (при category!=null)
  bool profileDetails = false; //false - профиль, true - подробности

  void gotoLanding() {
    isLanding = true;
    notifyListeners();
  }

  void gotoCart() {
    isLanding = false;
    tabIndex = 1;
    notifyListeners();
  }

  void gotoCategories() {
    isLanding = false;
    tabIndex = 0;
    this.category = null;
    notifyListeners();
  }

  void gotoProducts(int category) {
    isLanding = false;
    tabIndex = 0;
    this.category = category;
    this.product = null;
    notifyListeners();
  }

  void gotoProduct(int category, int product) {
    isLanding = false;
    tabIndex = 0;
    this.category = category;
    this.product = product;
    notifyListeners();
  }

  void gotoProfile() {
    isLanding = false;
    tabIndex = 2;
    profileDetails = false;
    notifyListeners();
  }

  void gotoProfileDetails() {
    isLanding = false;
    tabIndex = 2;
    profileDetails = true;
    notifyListeners();
  }
}

/*
TODO:

- /profile - страница профиля
- /profile/details - дополнительная страница профиля
- /cart - страница с корзиной
- /categories - список категорий
- /category/:id - категория товаров (список)
- /product/:id - описание товара
*/

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({super.key});

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Cart()),
          ChangeNotifierProvider(create: (_) => NavigationState()),
          Provider(create: (_) => authorizedUser),
          Provider(create: (_) => NestedShopNavigationController()),
          Provider(create: (_) => NestedProfileNavigationController()),
          Provider(create: (_) => RootNavigationController()),
        ],
        child: Builder(
          builder: (context) {
            final navigationStateHolder = context.watch<NavigationState>();
            final controller = context.read<RootNavigationController>();

            return MaterialApp(
              title: 'Ya Shopping',
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                AppLocalizations.delegate,
              ],
              locale: Locale.fromSubtags(
                languageCode: navigationStateHolder.language.name,
              ),
              supportedLocales: [
                Locale('ru'),
                Locale('en'),
              ],
              theme: ThemeData(
                extensions: [
                  YaShoppingTheme(),
                ],
                textTheme: TextTheme(
                  titleLarge: TextStyle(fontSize: 32),
                  titleMedium: TextStyle(fontSize: 24),
                  bodyLarge: TextStyle(fontSize: 24),
                  bodyMedium: TextStyle(fontSize: 22),
                  displaySmall: TextStyle(fontSize: 24),
                  displayMedium: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(3, 3),
                        color: Colors.black26,
                      )
                    ],
                  ),
                ),
                primarySwatch: Colors.blue,
              ),
              home: Builder(
                builder: (context) {
                  return Navigator(
                    key: controller.key,
                    onPopPage: (route, result) => route.didPop(result),
                    pages: [
                      if (navigationStateHolder.isLanding)
                        MaterialPage(child: LandingPage()),
                      if (!navigationStateHolder.isLanding)
                        MaterialPage(
                          child: Scaffold(
                            appBar: AppBar(
                              title: Text(AppLocalizations.of(context)!.shop),
                            ),
                            floatingActionButtonLocation:
                                FloatingActionButtonLocation.endTop,
                            floatingActionButton: IconButton(
                              icon: Flag.fromString(
                                navigationStateHolder.flag,
                                width: Theme.of(context)
                                    .extension<YaShoppingTheme>()!
                                    .flagSize,
                                height: Theme.of(context)
                                    .extension<YaShoppingTheme>()!
                                    .flagSize,
                              ),
                              onPressed: navigationStateHolder.switchLanguage,
                            ),
                            bottomNavigationBar: Consumer<Cart>(
                              builder: (context, cart, _) =>
                                  BottomNavigationBar(
                                items: [
                                  BottomNavigationBarItem(
                                    icon: Icon(Icons.shopping_bag),
                                    label:
                                        AppLocalizations.of(context)!.products,
                                  ),
                                  BottomNavigationBarItem(
                                    icon: Badge(
                                      label: Text(
                                        cart.count.toString(),
                                      ),
                                      child: Icon(Icons.shopping_cart),
                                    ),
                                    label: AppLocalizations.of(context)!.cart,
                                  ),
                                  BottomNavigationBarItem(
                                    icon: Icon(Icons.account_box_outlined),
                                    label:
                                        AppLocalizations.of(context)!.profile,
                                  )
                                ],
                                currentIndex: navigationStateHolder.tabIndex,
                                onTap: (_newIndex) {
                                  switch (_newIndex) {
                                    case 0:
                                      navigationStateHolder.gotoCategories();
                                    case 1:
                                      navigationStateHolder.gotoCart();
                                    case 2:
                                      navigationStateHolder.gotoProfile();
                                  }
                                },
                              ),
                            ),
                            body: IndexedStack(
                              index: navigationStateHolder.tabIndex,
                              children: [
                                NestedNavigationShopPage(),
                                CartPage(),
                                NestedNavigationProfilePage(),
                              ],
                            ),
                          ),
                        )
                    ],
                  );
                },
              ),
            );
          },
        ),
      );
}

import '../../src/auth/presentation/pages/login/login_page.dart';
import '../../src/cart/presentation/cart/pages/cart_page.dart';
import '../../src/product/presentation/pages/home/product_page.dart';
import '../../src/main_index.dart';

class Routes {
  static const String intro = '/';
  static const String loginPage = 'loginUI';
  static const String navigationPages = 'navigationPages';
  static const String profile = 'profile';
  static const String homePage = 'homePage';
  static const String cartPage = 'cartPage';

  /* ====================================================================== */

  static final routes = <String, Widget Function(BuildContext)>{
    loginPage: (context) => LoginPage(),
     homePage: (context) => ProductPage(),

    /* ====================================================================== */
    cartPage: (context) => CartPage(),
  };
}

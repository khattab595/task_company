import '../../src/auth/presentation/pages/login/login_page.dart';
import '../../src/cart/presentation/cart/pages/cart_page.dart';
import '../../src/home/presentation/pages/home/home_page.dart';
import '../../src/main_index.dart';
import '../../src/nav_bar/presentation/pages/main_navgation_bar.dart';

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
    navigationPages: (context) => NavigationBarPage(),
    homePage: (context) => HomePage(),

    /* ====================================================================== */
    cartPage: (context) => CartPage(),
  };
}
